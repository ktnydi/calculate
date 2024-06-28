import 'package:auto_size_text/auto_size_text.dart';
import 'package:calculate/analytics.dart';
import 'package:calculate/config.dart';
import 'package:calculate/enums/quiz_type.dart';
import 'package:calculate/extensions/context.dart';
import 'package:calculate/model/use_cases/quiz_size.dart';
import 'package:calculate/model/use_cases/quiz_time.dart';
import 'package:calculate/presentation/pages/game/game_page.dart';
import 'package:calculate/presentation/pages/help/help_page.dart';
import 'package:calculate/presentation/widgets/ad/ad_unit_id/ad_unit_id.dart';
import 'package:calculate/presentation/widgets/ad/bottom_ad_banner.dart';
import 'package:calculate/presentation/pages/setting/setting_page.dart';
import 'package:calculate/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:lottie/lottie.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final analytics = ref.watch(analyticsProvider);
    final limit = ref.watch(quizTimeNotifierProvider);
    final quizLength = ref.watch(quizSizeNotifierProvider);

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: context.colorScheme.surface,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Help(),
                ),
              );
            },
            icon: const Icon(Icons.menu),
          )
        ],
      ),
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            const SizedBox(height: kToolbarHeight),
            Expanded(
              child: LayoutBuilder(builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: constraints.maxWidth,
                      minHeight: constraints.minHeight,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Material(
                                    color: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      side: BorderSide(
                                        color: context.colorScheme.onSurface,
                                        width: 2,
                                      ),
                                    ),
                                    child: Lottie.asset(
                                      'assets/app_icon.json',
                                      width: 80,
                                      height: 80,
                                      repeat: false,
                                    ),
                                  ),
                                  const SizedBox(height: 32),
                                  AutoSizeText(
                                    L10n.of(context)!.appTitle,
                                    style: context.textTheme.headlineLarge!
                                        .copyWith(
                                      color: context.colorScheme.onSurface,
                                    ),
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 64),
                          IntrinsicWidth(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor:
                                        context.colorScheme.surface,
                                    foregroundColor:
                                        context.colorScheme.onSurface,
                                    side: BorderSide(
                                      width: 2,
                                      color: context.colorScheme.outlineVariant,
                                    ),
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero,
                                    ),
                                    minimumSize: const Size(232, 80),
                                  ),
                                  onPressed: () {
                                    analytics
                                      ..logStartGame()
                                      ..logNumberOfQuizMode();

                                    ref.invalidate(quizProvider);

                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        fullscreenDialog: true,
                                        builder: (context) => const Game(
                                          quizType: QuizType.numQuizzes,
                                        ),
                                      ),
                                    );
                                  },
                                  child: FittedBox(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          L10n.of(context)!.quizType(
                                              QuizType.numQuizzes.name),
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          L10n.of(context)!
                                              .quizSize(quizLength),
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          style: context.textTheme.bodyMedium!
                                              .copyWith(
                                            color: context
                                                .textTheme.bodySmall!.color,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor:
                                        context.colorScheme.surface,
                                    foregroundColor:
                                        context.colorScheme.onSurface,
                                    side: BorderSide(
                                      width: 2,
                                      color: context.colorScheme.outlineVariant,
                                    ),
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero,
                                    ),
                                    minimumSize: const Size(232, 80),
                                  ),
                                  onPressed: () {
                                    analytics
                                      ..logStartGame()
                                      ..logTimeLimitMode();

                                    ref.invalidate(quizProvider);

                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        fullscreenDialog: true,
                                        builder: (context) => const Game(
                                          quizType: QuizType.timeLimit,
                                        ),
                                      ),
                                    );
                                  },
                                  child: FittedBox(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          L10n.of(context)!.quizType(
                                              QuizType.timeLimit.name),
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          '$limit ${L10n.of(context)!.seconds}',
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          style: context.textTheme.bodyMedium!
                                              .copyWith(
                                            color: context
                                                .textTheme.bodySmall!.color,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Setting(),
                                ),
                              );
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: context.colorScheme.onSurface,
                              textStyle: context.textTheme.labelLarge!.copyWith(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            child: Text(L10n.of(context)!.settingsButtonLabel),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
            const BottomAdBanner(
              adUnitId: AdUnitId(
                android: androidHomeBottomCenter,
                ios: iosHomeBottomCenter,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
