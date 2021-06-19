import 'dart:convert';

import 'package:calculate/domains/update_info/update_info.dart';
import 'package:calculate/enums/update_request_type.dart';
import 'package:calculate/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info/package_info.dart';
import 'package:version/version.dart';

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
