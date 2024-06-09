import 'dart:math';

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
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final analytics = ref.watch(analyticsProvider);
    final limit = ref.watch(quizTimeNotifierProvider);
    final quizLength = ref.watch(quizSizeNotifierProvider);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Column(
          children: [
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
                              Image.asset(
                                'assets/blobs.png',
                                width:
                                    min(MediaQuery.of(context).size.width, 320),
                                color: Colors.black12,
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  AutoSizeText(
                                    L10n.of(context)!.appTitle,
                                    style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                      color: context.colorScheme.onPrimary,
                                    ),
                                    maxLines: 1,
                                  ),
                                  const SizedBox(height: 32),
                                  AutoSizeText(
                                    L10n.of(context)!.appMessage,
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: context.colorScheme.onPrimary,
                                    ),
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 32),
                          IntrinsicWidth(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                FilledButton(
                                  style: FilledButton.styleFrom(
                                    backgroundColor:
                                        context.colorScheme.surface,
                                    foregroundColor:
                                        context.colorScheme.onSurface,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
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
                                          style: context.textTheme.labelSmall,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                FilledButton(
                                  style: FilledButton.styleFrom(
                                    backgroundColor:
                                        context.colorScheme.surface,
                                    foregroundColor:
                                        context.colorScheme.onSurface,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
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
                                        const SizedBox(height: 4),
                                        Text(
                                          '$limit ${L10n.of(context)!.seconds}',
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          style: context.textTheme.labelSmall,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                      child: FilledButton(
                                        style: FilledButton.styleFrom(
                                          backgroundColor:
                                              context.colorScheme.surface,
                                          foregroundColor:
                                              context.colorScheme.onSurface,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                          minimumSize: const Size(112, 56),
                                        ),
                                        onPressed: () async {
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const Setting(),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          L10n.of(context)!.settingsButtonLabel,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: FilledButton(
                                        style: FilledButton.styleFrom(
                                          backgroundColor:
                                              context.colorScheme.surface,
                                          foregroundColor:
                                              context.colorScheme.onSurface,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                          minimumSize: const Size(112, 56),
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const Help(),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          L10n.of(context)!.helpButtonLabel,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
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
