import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:calculate/analytics.dart';
import 'package:calculate/config.dart';
import 'package:calculate/domains/quiz/quiz.dart';
import 'package:calculate/domains/update_info/update_info.dart';
import 'package:calculate/enums/flavor.dart';
import 'package:calculate/enums/quiz_category.dart';
import 'package:calculate/enums/update_request_type.dart';
import 'package:calculate/repositories/quiz_repository.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:version/version.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>(
  (_) => throw UnimplementedError(),
);

final packageInfoProvider = Provider<PackageInfo>(
  (_) => throw UnimplementedError(),
);

final quizProvider = FutureProvider<Quiz>(
  (ref) async {
    final random = Random();
    final quizCategory = QuizCategory.values.firstWhere(
      (value) => value.index == random.nextInt(5),
      orElse: () => QuizCategory.additional,
    );
    switch (quizCategory) {
      case QuizCategory.additional:
        return ref.read(quizRepositoryProvider).getAdditional();
      case QuizCategory.subtraction:
        return ref.read(quizRepositoryProvider).getSubtraction();
      case QuizCategory.division:
        return ref.read(quizRepositoryProvider).getDivision();
      case QuizCategory.multiplication:
        return ref.read(quizRepositoryProvider).getMultiplication();
    }
  },
);

final randomQuizProvider = FutureProvider<List<Quiz>>(
  (ref) async {
    final prefs = ref.read(sharedPreferencesProvider);
    final quizLength = prefs.getInt('limit') ?? 100;
    final quizList = <Quiz>[];
    final random = Random();
    const minNum = 10;
    const maxNum = 100;
    final createNum = (int min, int max) => min + random.nextInt(max - min);

    for (int i = 0; i < quizLength; i++) {
      final isAddition = random.nextBool();
      final num1 = createNum(minNum, maxNum);
      final num2 = createNum(minNum, maxNum);
      final figures = [num1, num2];
      if (!isAddition) {
        /// 引き算なら降順にする。
        figures.sort((i, j) => j - i);
      }
      final type =
          isAddition ? QuizCategory.additional : QuizCategory.subtraction;
      final quiz = Quiz(figures: figures, type: type);
      quizList.add(quiz);
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

final bannerAdProvider = FutureProvider.family<BannerAd, BuildContext>(
  (ref, context) async {
    final flavor = ref.read(flavorProvider);
    final isProduction = flavor == Flavor.production;

    var status = await AppTrackingTransparency.trackingAuthorizationStatus;

    if (status == TrackingStatus.notDetermined) {
      status = await AppTrackingTransparency.requestTrackingAuthorization();

      if (isProduction) ref.read(analyticsProvider).logTracking(status);
    }

    // ユニットIdはlib/config.dartに記述済み。（Github管理対象外）
    final unitId = Platform.isAndroid ? androidUnitId : iosUnitId;
    final unitDemoId = Platform.isAndroid ? androidDemoUnitId : iosDemoUnitId;
    final BannerAd myBanner = BannerAd(
      adUnitId: isProduction ? unitId : unitDemoId,
      size: await AdSize.getAnchoredAdaptiveBannerAdSize(
            Orientation.portrait,
            MediaQuery.of(context).size.width.toInt(),
          ) ??
          AdSize.banner,
      request: AdRequest(),
      listener: BannerAdListener(),
    );
    myBanner.load();
    return myBanner;
  },
);
