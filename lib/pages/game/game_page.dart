import 'dart:ui';

import 'package:calculate/analytics.dart';
import 'package:calculate/enums/preference.dart';
import 'package:calculate/enums/quiz_type.dart';
import 'package:calculate/pages/game/game_notifier.dart';
import 'package:calculate/pages/game_result/game_result_page.dart';
import 'package:calculate/pages/home/home_page.dart';
import 'package:calculate/providers.dart';
import 'package:calculate/widgets/figure_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Game extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quiz = ref.watch(quizProvider);
    final gameNotifier = ref.watch(gameProvider.notifier);
    final gameState = ref.watch(gameProvider);
    final analytics = ref.watch(analyticsProvider);
    final prefs = ref.watch(sharedPreferencesProvider);
    final quizType = QuizType.values.firstWhere(
      (value) => value.id == prefs.getInt(Preferences.quizType.key),
      orElse: () => Preferences.quizType.defaultValue,
    );
    final limit = prefs.getInt(Preferences.timeLimit.key) ??
        Preferences.timeLimit.defaultValue;
    final quizLength = prefs.getInt(Preferences.numQuizzes.key) ??
        Preferences.numQuizzes.defaultValue;
    final keyboardLocation = prefs.getInt(Preferences.keyboardLocation.key) ??
        Preferences.keyboardLocation.defaultValue;

    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: CloseButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                  ),
                  builder: (context) {
                    return SafeArea(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 40,
                            height: 3,
                            margin: EdgeInsets.symmetric(vertical: 16),
                            decoration: BoxDecoration(
                              color: Theme.of(context).dividerColor,
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '中断してもよろしいですか？',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'ホーム画面に戻ります。',
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .color,
                                  ),
                                ),
                                const SizedBox(height: 32),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      child: Text('キャンセル'),
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(22),
                                        ),
                                        backgroundColor: Colors.grey.shade200,
                                        minimumSize: Size(120, 44),
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                    const SizedBox(width: 16),
                                    ElevatedButton(
                                      child: Text('中断する'),
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(22),
                                        ),
                                        minimumSize: Size(120, 44),
                                      ),
                                      onPressed: () {
                                        analytics.logStopGame();
                                        Navigator.popUntil(
                                          context,
                                          (route) => route.isFirst,
                                        );
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Home(),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
            title: Text(
              quizType == QuizType.numQuizzes
                  ? '${gameState.index + 1}／${quizLength}問'
                  : '第${gameState.index + 1}問',
              style: TextStyle(
                fontSize: 18,
                fontFeatures: [
                  FontFeature.tabularFigures(),
                ],
              ),
            ),
          ),
          body: quiz.when(
            loading: () {
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            },
            error: (error, _) {
              return Center(
                child: Text(
                  error.toString(),
                ),
              );
            },
            data: (quiz) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          quiz.title,
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w300,
                            fontFeatures: [
                              FontFeature.tabularFigures(),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '=',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            const SizedBox(width: 8),
                            Container(
                              width: 180,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Theme.of(context).dividerColor,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  '${gameState.answer.join()}',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Divider(height: 1, thickness: 1),
                  Container(
                    color: Colors.grey.shade200,
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        Container(
                          width: quizType == QuizType.numQuizzes
                              ? MediaQuery.of(context).size.width *
                                  (gameState.answerList.length / quizLength)
                              : MediaQuery.of(context).size.width *
                                  (gameState.leftTime / limit),
                          height: 30,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              quizType == QuizType.numQuizzes
                                  ? '残り：${quizLength - gameState.answerList.length}問'
                                  : '残り：${gameState.leftTime}秒',
                              style: TextStyle(
                                fontFeatures: [
                                  FontFeature.tabularFigures(),
                                ],
                              ),
                            ),
                            const Text('／'),
                            Text(
                              '正答数：${gameState.correctList.where((e) => e == true).length}',
                              style: TextStyle(
                                fontFeatures: [
                                  FontFeature.tabularFigures(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: SafeArea(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Divider(height: 1, thickness: 1),
                          Row(
                            children: [
                              if (keyboardLocation == 2)
                                const SizedBox(width: 80),
                              Flexible(
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 1),
                                  color: Theme.of(context).dividerColor,
                                  child: GridView.count(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    crossAxisCount: 3,
                                    childAspectRatio: 5 / 3,
                                    mainAxisSpacing: 1,
                                    crossAxisSpacing: 1,
                                    children: List.generate(
                                      12,
                                      (index) {
                                        if (index == 9) {
                                          return FigureButton(
                                            child: Text('C'),
                                            onPressed: () {
                                              gameNotifier.clearAnswer();
                                            },
                                          );
                                        }

                                        if (index == 11) {
                                          return FigureButton(
                                            child: Text('OK'),
                                            onPressed: () {
                                              if (gameState.answer.isEmpty) {
                                                return;
                                              }
                                              gameNotifier.checkAnswer(quiz);
                                              final lastIndex = quizLength - 1;
                                              if (quizType ==
                                                      QuizType.numQuizzes &&
                                                  gameState.index ==
                                                      lastIndex) {
                                                return gameNotifier
                                                    .finishQuiz();
                                              }
                                              ref.refresh(quizProvider);
                                              gameNotifier.clearAnswer();
                                              gameNotifier.nextQuiz();
                                            },
                                          );
                                        }

                                        final isZeroBtn = index == 10;
                                        index = isZeroBtn ? -1 : index;

                                        return FigureButton(
                                          child: Text('${index + 1}'),
                                          onPressed: () {
                                            gameNotifier
                                                .fillInAnswer(index + 1);
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              if (keyboardLocation == 1)
                                const SizedBox(width: 80),
                            ],
                          ),
                          const Divider(height: 1, thickness: 1),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        if (gameState.leftTime == 0 || gameState.isFinished)
          Container(
            color: Colors.black26,
            child: Center(
              child: Material(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Container(
                  width: 300,
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        gameState.correctList.length != quizLength
                            ? 'タイムアップ'
                            : '終了',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        child: Text('結果を見る'),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22),
                          ),
                          minimumSize: Size(120, 44),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GameResult(
                                gameState.leftTime,
                                gameState.answerList,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
