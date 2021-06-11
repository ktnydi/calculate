import 'dart:convert';

import 'package:calculate/domains/quiz/quiz.dart';
import 'package:calculate/domains/update_info/update_info.dart';
import 'package:calculate/enums/flavor.dart';
import 'package:calculate/enums/update_request_type.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:version/version.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>(
  (_) => throw UnimplementedError(),
);

final packageInfoProvider = Provider<PackageInfo>(
  (_) => throw UnimplementedError(),
);

final quizProvider = FutureProvider<List<Quiz>>(
  (ref) async {
    final prefs = ref.read(sharedPreferencesProvider);
    final isRandom = prefs.getBool('isRandom') ?? false;
    final jsonString = await rootBundle.loadString('assets/quiz.json');
    final List json = await jsonDecode(jsonString);
    final quizList = json.map((json) => Quiz.fromJson(json)).toList();
    if (isRandom) {
      quizList..shuffle();
    }
    return quizList;
  },
);

final remoteConfigProvider = Provider<RemoteConfig>(
  (ref) {
    final rc = RemoteConfig.instance;
    final flavor = ref.read(flavorProvider);
    final interval = flavor == Flavor.production
        ? Duration(minutes: 12)
        : Duration(seconds: 10);
    rc.setConfigSettings(
      RemoteConfigSettings(
        minimumFetchInterval: interval,
        fetchTimeout: Duration(minutes: 1),
      ),
    );
    return rc;
  },
);

final updateRequestProvider = FutureProvider<UpdateRequestType>(
  (ref) async {
    final remoteConfig = ref.watch(remoteConfigProvider);
    await remoteConfig.fetchAndActivate();
    final packageInfo = await PackageInfo.fromPlatform();
    final updateInfoJson = remoteConfig.getString('update_info');
    if (updateInfoJson.isEmpty) {
      return UpdateRequestType.not;
    }
    final map = json.decode(updateInfoJson) as Map<String, Object?>;
    final updateInfo = UpdateInfo.fromJson(map);
    final enabledAt = updateInfo.enabledAt;
    final requiredVersion = Version.parse(updateInfo.requiredVersion);
    final currentVersion = Version.parse(packageInfo.version);
    final hasNewVersion = currentVersion < requiredVersion;
    final isEnabled = enabledAt.compareTo(DateTime.now()) < 0;

    if (!isEnabled || !hasNewVersion) {
      return UpdateRequestType.not;
    }

    return updateInfo.canCancel
        ? UpdateRequestType.cancelable
        : UpdateRequestType.forcibly;
  },
);
