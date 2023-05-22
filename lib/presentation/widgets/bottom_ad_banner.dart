import 'dart:io';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:calculate/config.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BottomAdBanner extends StatefulWidget {
  const BottomAdBanner({Key? key}) : super(key: key);

  @override
  State<BottomAdBanner> createState() => _BottomAdBannerState();
}

class _BottomAdBannerState extends State<BottomAdBanner> {
  BannerAd? ad;

  @override
  Widget build(BuildContext context) {
    Future<TrackingStatus> requestTracking() async {
      var status = await AppTrackingTransparency.trackingAuthorizationStatus;

      if (status == TrackingStatus.notDetermined) {
        status = await AppTrackingTransparency.requestTrackingAuthorization();
      }

      return status;
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
          await requestTracking();

          final width = constraints.maxWidth.truncate();
          final orientation = Orientation.portrait;
          final adaptiveSize = await AdSize.getAnchoredAdaptiveBannerAdSize(
            orientation,
            width,
          );

          final ad = BannerAd(
            size: adaptiveSize ?? AdSize.banner,
            // ユニットIdはlib/config.dartに記述済み。（Github管理対象外）
            adUnitId: Platform.isAndroid ? androidUnitId : iosUnitId,
            listener: BannerAdListener(
              onAdLoaded: (ad) {
                setState(() => this.ad = ad as BannerAd);
              },
              onAdFailedToLoad: (ad, error) {
                ad.dispose();
              },
            ),
            request: AdRequest(),
          );
          ad.load();
        });

        final bannerAd = ad;
        return bannerAd != null
            ? SizedBox(
                width: bannerAd.size.width.toDouble(),
                height: bannerAd.size.height.toDouble(),
                child: AdWidget(ad: bannerAd),
              )
            : const SizedBox();
      },
    );
  }
}
