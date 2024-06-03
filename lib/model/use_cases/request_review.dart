import 'package:in_app_review/in_app_review.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final requestReviewProvider = Provider(_RequestReview.new);

class _RequestReview {
  const _RequestReview(this.ref);

  final Ref ref;

  Future<void> call() async {
    final inAppReview = InAppReview.instance;
    if (!await inAppReview.isAvailable()) return;
    await inAppReview.requestReview();
  }

  Future<void> openAppStore() async {
    await InAppReview.instance.openStoreListing(appStoreId: '1572014520');
  }
}
