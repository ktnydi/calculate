import 'dart:math';

import 'package:calculate/analytics.dart';
import 'package:calculate/enums/preference.dart';
import 'package:calculate/enums/quiz_type.dart';
import 'package:calculate/pages/game/game_page.dart';
import 'package:calculate/pages/help/help_page.dart';
import 'package:calculate/pages/setting/setting_page.dart';
import 'package:calculate/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class Home extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final analytics = ref.watch(analyticsProvider);
    final prefs = ref.watch(sharedPreferencesProvider);
    final bannerAd = ref.watch(bannerAdProvider(context)).data?.value;
    final quizType = QuizType.values.firstWhere(
      (value) => value.id == prefs.getInt(Preferences.quizType.key),
      orElse: () => Preferences.quizType.defaultValue,
    );
    final limit = prefs.getInt(Preferences.timeLimit.key) ??
        Preferences.timeLimit.defaultValue;
    final quizLength = prefs.getInt(Preferences.numQuizzes.key) ??
        Preferences.numQuizzes.defaultValue;

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
                    color: Theme.of(context).colorScheme.primaryVariant,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Keisan Doriru',
                        style: TextStyle(
                          fontSize: 40,
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
                    'スタート\n（${quizType.name}・${quizType == QuizType.numQuizzes ? '$quizLength問' : '$limit秒'}）',
                    textAlign: TextAlign.center,
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    minimumSize: Size(232, 80),
                    primary: Colors.white,
                    onPrimary: Theme.of(context).colorScheme.primaryVariant,
                  ),
                  onPressed: () {
                    analytics.logStartGame();
                    ref.refresh(quizProvider);
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
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      minimumSize: Size(112, 56),
                      primary: Colors.white,
                      onPrimary: Theme.of(context).colorScheme.primaryVariant,
                    ),
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Setting(),
                        ),
                      );
                      ref.refresh(sharedPreferencesProvider);
                    },
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    child: Text('ヘルプ'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      minimumSize: Size(112, 56),
                      primary: Colors.white,
                      onPrimary: Theme.of(context).colorScheme.primaryVariant,
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
