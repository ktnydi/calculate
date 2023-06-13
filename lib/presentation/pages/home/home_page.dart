import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:calculate/analytics.dart';
import 'package:calculate/config.dart';
import 'package:calculate/enums/quiz_category_mode.dart';
import 'package:calculate/enums/quiz_type.dart';
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
    final quizType = ref.watch(quizTypeNotifierProvider);
    final limit = ref.watch(quizTimeNotifierProvider);
    final quizLength = ref.watch(quizSizeNotifierProvider);
    final quizCategoryModeState = ref.watch(quizCategoryModeNotifierProvider);

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
                                    style: const TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 1,
                                  ),
                                  const SizedBox(height: 32),
                                  AutoSizeText(
                                    L10n.of(context)!.appMessage,
                                    style: const TextStyle(
                                      fontSize: 24,
                                    ),
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 32),
                          Center(
                            child: FilledButton(
                              style: FilledButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                minimumSize: const Size(232, 80),
                              ),
                              onPressed: () {
                                analytics.logStartGame();
                                ref.invalidate(quizProvider);
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    fullscreenDialog: true,
                                    builder: (context) => const Game(),
                                  ),
                                );
                              },
                              child: FittedBox(
                                child: Text(
                                  '${L10n.of(context)!.startButtonLabel}\n'
                                  '（${L10n.of(context)!.quizCategoryMode(quizCategoryModeState.name)}・'
                                  '${L10n.of(context)!.quizType(quizType.name)}・'
                                  '${quizType == QuizType.numQuizzes ? L10n.of(context)!.quizSize(quizLength) : '$limit${L10n.of(context)!.seconds}'}）',
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              FilledButton(
                                style: FilledButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  minimumSize: const Size(112, 56),
                                ),
                                onPressed: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Setting(),
                                    ),
                                  );
                                },
                                child: Text(
                                  L10n.of(context)!.settingsButtonLabel,
                                ),
                              ),
                              const SizedBox(width: 8),
                              FilledButton(
                                style: FilledButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  minimumSize: const Size(112, 56),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Help(),
                                    ),
                                  );
                                },
                                child: Text(
                                  L10n.of(context)!.helpButtonLabel,
                                ),
                              ),
                            ],
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
