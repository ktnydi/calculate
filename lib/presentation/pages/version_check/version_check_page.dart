import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:app_review/app_review.dart';
import 'package:calculate/enums/update_request_type.dart';
import 'package:calculate/presentation/pages/home/home_page.dart';
import 'package:calculate/presentation/pages/initial_settings/initial_settings_screen.dart';
import 'package:calculate/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';

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
      final prefs = ref.watch(sharedPreferencesProvider);
      final isTutorialDone = prefs.getBool('isTutorialDone') ?? false;

      if (requestType == UpdateRequestType.not) {
        // ignore: use_build_context_synchronously
        if (!context.mounted) return;

        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 200),
            pageBuilder: (context, animation, secondaryAnimation) {
              return FadeTransition(
                opacity: animation.drive(Tween(begin: 0, end: 1)),
                child: isTutorialDone
                    ? const Home()
                    : const InitialSettingsScreen(),
              );
            },
          ),
        );

        return;
      }

      // ignore: use_build_context_synchronously
      if (!context.mounted) return;

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
          // ignore: use_build_context_synchronously
          if (!context.mounted) return;

          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(microseconds: 200),
              pageBuilder: (context, animation, secondaryAnimation) {
                return FadeTransition(
                  opacity: animation.drive(Tween(begin: 0, end: 1)),
                  child: isTutorialDone
                      ? const Home()
                      : const InitialSettingsScreen(),
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
        // ignore: use_build_context_synchronously
        if (!context.mounted) return;

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
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
