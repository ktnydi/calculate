import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:app_review/app_review.dart';
import 'package:calculate/enums/update_request_type.dart';
import 'package:calculate/presentation/pages/home/home_page.dart';
import 'package:calculate/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VersionCheckPage extends ConsumerStatefulWidget {
  const VersionCheckPage({Key? key}) : super(key: key);

  @override
  _VersionCheckPageState createState() => _VersionCheckPageState();
}

class _VersionCheckPageState extends ConsumerState<VersionCheckPage> {
  @override
  void initState() {
    super.initState();
    Future(() async {
      final requestType = await ref.read(updateRequestProvider.future);

      if (requestType == UpdateRequestType.not) {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 200),
            pageBuilder: (context, animation, secondaryAnimation) {
              return FadeTransition(
                opacity: animation.drive(Tween(begin: 0, end: 1)),
                child: Home(),
              );
            },
          ),
        );

        return;
      }

      final title = 'アップデートのお知らせ';
      final message = '新しいバージョンのアプリをリリースしました。アップデートしてください。';
      final cancelLabel = '後で行う';
      final okLabel = 'アップデート';

      if (requestType == UpdateRequestType.cancelable) {
        final result = await showOkCancelAlertDialog(
          context: context,
          title: title,
          message: message,
          okLabel: okLabel,
          cancelLabel: cancelLabel,
        );

        if (result == OkCancelResult.cancel) {
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(microseconds: 200),
              pageBuilder: (context, animation, secondaryAnimation) {
                return FadeTransition(
                  opacity: animation.drive(Tween(begin: 0, end: 1)),
                  child: Home(),
                );
              },
            ),
          );
        } else {
          AppReview.storeListing;
        }

        return;
      }

      if (requestType == UpdateRequestType.forcibly) {
        await showOkAlertDialog(
          context: context,
          title: title,
          message: message,
          okLabel: okLabel,
        );

        AppReview.storeListing;

        return;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
