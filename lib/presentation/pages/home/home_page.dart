import 'dart:math';

import 'package:calculate/analytics.dart';
import 'package:calculate/enums/quiz_category_mode.dart';
import 'package:calculate/enums/quiz_type.dart';
import 'package:calculate/model/use_cases/quiz_size.dart';
import 'package:calculate/model/use_cases/quiz_time.dart';
import 'package:calculate/presentation/pages/game/game_page.dart';
import 'package:calculate/presentation/pages/help/help_page.dart';
import 'package:calculate/presentation/pages/setting/setting_page.dart';
import 'package:calculate/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class Home extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final analytics = ref.watch(analyticsProvider);
    final bannerAd = ref.watch(bannerAdProvider(context)).value;
    final quizType = ref.watch(quizTypeNotifierProvider);
    final limit = ref.watch(quizTimeNotifierProvider);
    final quizLength = ref.watch(quizSizeNotifierProvider);
    final quizCategoryModeState = ref.watch(quizCategoryModeNotifierProvider);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height -
                (bannerAd?.size.height.toDouble() ?? 0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/blobs.png',
                    width: min(MediaQuery.of(context).size.width, 320),
                    color: Colors.black12,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Keisan Doriru',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                              color:
                                  Theme.of(context).textTheme.bodyMedium!.color,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 32),
                      Text(
                        'Let\'s challenge!',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Center(
                child: ElevatedButton(
                  child: Text(
                    'スタート\n（${quizCategoryModeState.name}・${quizType.name}・${quizType == QuizType.numQuizzes ? '$quizLength問' : '$limit秒'}）',
                    textAlign: TextAlign.center,
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    minimumSize: Size(232, 80),
                  ),
                  onPressed: () {
                    analytics.logStartGame();
                    ref.invalidate(quizProvider);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        fullscreenDialog: true,
                        builder: (context) => Game(),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    child: Text('設定'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      minimumSize: Size(112, 56),
                    ),
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Setting(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    child: Text('ヘルプ'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      minimumSize: Size(112, 56),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Help(),
                        ),
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: bannerAd != null
          ? SafeArea(
              child: Container(
                height: bannerAd.size.height.toDouble(),
                child: AdWidget(ad: bannerAd),
              ),
            )
          : null,
    );
  }
}
