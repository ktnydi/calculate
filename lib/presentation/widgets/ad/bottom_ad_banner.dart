import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:calculate/presentation/widgets/ad/ad_unit_id/ad_unit_id.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BottomAdBanner extends StatefulWidget {
  const BottomAdBanner({
    Key? key,
    required this.adUnitId,
  }) : super(key: key);

  final AdUnitId adUnitId;

  @override
  State<BottomAdBanner> createState() => _BottomAdBannerState();
}

class _BottomAdBannerState extends State<BottomAdBanner> {
  BannerAd? ad;

  @override
  void dispose() {
    ad?.dispose();
    super.dispose();
  }

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
        if (ad == null) {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
            await requestTracking();

            final width = constraints.maxWidth.truncate();
            const orientation = Orientation.portrait;
            final adaptiveSize = await AdSize.getAnchoredAdaptiveBannerAdSize(
              orientation,
              width,
            );

            final ad = BannerAd(
              size: adaptiveSize ?? AdSize.banner,
              adUnitId: widget.adUnitId.platform,
              listener: BannerAdListener(
                onAdLoaded: (ad) {
                  setState(() => this.ad = ad as BannerAd);
                },
                onAdFailedToLoad: (ad, error) {
                  ad.dispose();
                },
              ),
              request: const AdRequest(),
            );

            ad.load();
          });
        }

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
