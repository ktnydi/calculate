import 'dart:io';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:calculate/analytics.dart';
import 'package:calculate/config.dart';
import 'package:calculate/enums/flavor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

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
