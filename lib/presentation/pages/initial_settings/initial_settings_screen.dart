import 'package:calculate/extensions/context.dart';
import 'package:calculate/presentation/pages/home/home_page.dart';
import 'package:calculate/presentation/pages/initial_settings/pages/quiz_type_settings_panel.dart';
import 'package:calculate/presentation/pages/initial_settings/pages/wellcome_panel.dart';
import 'package:calculate/providers/shared_preferences_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sliding_tutorial/flutter_sliding_tutorial.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';

final pageControllerProvider = Provider.autoDispose((ref) {
  final controller = PageController();

  controller.addListener(() {
    ref.read(pageNotifierProvider).value = controller.page ?? 0;
  });

  ref.onDispose(() => controller.dispose());

  return controller;
});

final pageNotifierProvider = Provider.autoDispose((ref) {
  final notifier = ValueNotifier<double>(0);

  ref.onDispose(() => notifier.dispose());

  return notifier;
});

class InitialSettingsScreen extends ConsumerWidget {
  const InitialSettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = ref.watch(pageControllerProvider);
    final notifier = ref.watch(pageNotifierProvider);

    final panels = [
      const WellcomePanel(),
      const QuizTypeSettingsPanel(),
    ];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 32),
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  controller: pageController,
                  children: List.generate(
                    panels.length,
                    (index) {
                      return SlidingPage(
                        page: index,
                        notifier: notifier,
                        child: panels[index],
                      );
                    },
                  ),
                ),
              ),
              ValueListenableBuilder(
                valueListenable: notifier,
                builder: (context, value, child) {
                  final isLast = notifier.value.round() == panels.length - 1;

                  if (!isLast) {
                    return FilledButton(
                      onPressed: () {
                        pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      style: FilledButton.styleFrom(
                        shape: const CircleBorder(),
                        minimumSize: const Size(56, 56),
                      ),
                      child: const Icon(Icons.navigate_next),
                    );
                  }

                  return FilledButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation, _) {
                            final prefs = ref.watch(sharedPreferencesProvider);
                            prefs.setBool('isTutorialDone', true);

                            return FadeTransition(
                              opacity: animation.drive(Tween(begin: 0, end: 1)),
                              child: const Home(),
                            );
                          },
                        ),
                      );
                    },
                    style: FilledButton.styleFrom(
                      shape: const StadiumBorder(),
                      minimumSize: const Size(240, 56),
                    ),
                    child: Text(
                      L10n.of(context)!.finishTutorialButtonLabel,
                    ),
                  );
                },
              ),
              const SizedBox(height: 32),
              SlidingIndicator(
                notifier: notifier,
                activeIndicator: Icon(
                  Icons.circle,
                  color: context.colorScheme.primary,
                ),
                inActiveIndicator: Icon(
                  Icons.circle,
                  color: context.colorScheme.outlineVariant,
                ),
                indicatorCount: panels.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
