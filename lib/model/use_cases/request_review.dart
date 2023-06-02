import 'package:app_review/app_review.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final requestReviewProvider = Provider(_RequestReview.new);

class _RequestReview {
  const _RequestReview(this.ref);

  final Ref ref;

  Future<void> call() async {
    if (!await AppReview.isRequestReviewAvailable) return;
    await AppReview.requestReview;
  }
}
