import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:calculate/extensions/context.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:calculate/enums/update_request_type.dart';
import 'package:calculate/presentation/pages/home/home_page.dart';
import 'package:calculate/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:lottie/lottie.dart';

class VersionCheckPage extends ConsumerStatefulWidget {
  const VersionCheckPage({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _VersionCheckPageState();
}

class _VersionCheckPageState extends ConsumerState<VersionCheckPage> {
  @override
  void initState() {
    super.initState();
    Future(() async {
      final requestType = await ref.read(updateRequestProvider.future);

      if (requestType == UpdateRequestType.not) {
        if (!mounted) return;

        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 200),
            pageBuilder: (context, animation, secondaryAnimation) {
              return FadeTransition(
                opacity: animation.drive(Tween(begin: 0, end: 1)),
                child: const Home(),
              );
            },
          ),
        );

        return;
      }

      if (!mounted) return;

      final title = L10n.of(context)!.updateRequestTitle;
      final message = L10n.of(context)!.updateRequestMessage;
      final cancelLabel = L10n.of(context)!.cancelUpdateButtonLabel;
      final okLabel = L10n.of(context)!.okUpdateButtonLabel;

      if (requestType == UpdateRequestType.cancelable) {
        // ignore: use_build_context_synchronously
        if (!context.mounted) return;

        final result = await showOkCancelAlertDialog(
          context: context,
          title: title,
          message: message,
          okLabel: okLabel,
          cancelLabel: cancelLabel,
        );

        if (result == OkCancelResult.cancel) {
          if (!mounted) return;

          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(microseconds: 200),
              pageBuilder: (context, animation, secondaryAnimation) {
                return FadeTransition(
                  opacity: animation.drive(Tween(begin: 0, end: 1)),
                  child: const Home(),
                );
              },
            ),
          );
        } else {
          await InAppReview.instance.openStoreListing(appStoreId: '1572014520');
        }

        return;
      }

      if (requestType == UpdateRequestType.forcibly) {
        // ignore: use_build_context_synchronously
        if (!context.mounted) return;

        await showOkAlertDialog(
          context: context,
          title: title,
          message: message,
          okLabel: okLabel,
        );

        await InAppReview.instance.openStoreListing(appStoreId: '1572014520');

        return;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colorScheme.surface,
      child: Center(
        child: Lottie.asset(
          'assets/loading.json',
          width: 160,
          delegates: LottieDelegates(
            values: [
              ValueDelegate.color(
                ['**'],
                value: context.colorScheme.onSurface,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
