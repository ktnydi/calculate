import 'dart:ui';

import 'package:calculate/analytics.dart';
import 'package:calculate/enums/keyboard_location.dart';
import 'package:calculate/enums/quiz_type.dart';
import 'package:calculate/model/use_cases/quiz_size.dart';
import 'package:calculate/model/use_cases/quiz_time.dart';
import 'package:calculate/presentation/pages/game/game_notifier.dart';
import 'package:calculate/presentation/pages/game_result/game_result_page.dart';
import 'package:calculate/presentation/pages/home/home_page.dart';
import 'package:calculate/providers.dart';
import 'package:calculate/presentation/widgets/figure_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Game extends ConsumerStatefulWidget {
  const Game({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GameState();
}

class _GameState extends ConsumerState<Game> with TickerProviderStateMixin {
  late final AnimationController quizAnimation;

  @override
  void initState() {
    quizAnimation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    quizAnimation.addListener(() {
      if (quizAnimation.isCompleted) {
        quizAnimation.reverse();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    quizAnimation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final quiz = ref.watch(quizProvider);
    final gameNotifier = ref.watch(gameProvider.notifier);
    final gameState = ref.watch(gameProvider);
    final analytics = ref.watch(analyticsProvider);
    final quizTypeState = ref.watch(quizTypeNotifierProvider);
    final quizTimeState = ref.watch(quizTimeNotifierProvider);
    final quizSizeState = ref.watch(quizSizeNotifierProvider);
    final keyboardLocation = ref.watch(keyboardLocationProvider);

    ref.listen(
      gameProvider.select((value) => int.tryParse(value.answer)),
      (previous, next) {
        if (next == null) return;
        if (next != quiz.correctAnswer) return;
        if (gameState.index == quizSizeState - 1) return;
        quizAnimation.forward();
      },
    );

    ref.listen(
      gameProvider.select((value) => int.tryParse(value.answer)),
      (previous, next) {
        if (next == null) return;
        if (next != quiz.correctAnswer) return;

        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          gameNotifier.checkAnswer(quiz);
          final lastIndex = quizSizeState - 1;
          if (quizTypeState == QuizType.numQuizzes &&
              gameState.index == lastIndex) {
            return gameNotifier.finishQuiz();
          }
          ref.invalidate(quizProvider);
          gameNotifier.clearAnswer();
          gameNotifier.nextQuiz();
        });
      },
    );

    ref.listen(
      gameProvider,
      (previous, next) {
        if (next.leftTime != 0 && !next.isFinished) return;

        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 500),
            pageBuilder: (context, animation, _) {
              return GameResult(
                next.leftTime,
                next.answerList,
              );
            },
            transitionsBuilder: (context, animation, _, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
        );
      },
    );

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
              quizTypeState == QuizType.numQuizzes
                  ? '${gameState.index + 1}／${quizSizeState}問'
                  : '第${gameState.index + 1}問',
              style: TextStyle(
                fontSize: 18,
                fontFeatures: [
                  FontFeature.tabularFigures(),
                ],
              ),
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Center(
                  child: SlideTransition(
                    position: Tween(
                      begin: Offset.zero,
                      end: Offset(0, 0.05),
                    ).animate(quizAnimation),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
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
                                  gameState.answer,
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
                ),
              ),
              const Divider(height: 1, thickness: 1),
              Container(
                color: Colors.grey.shade200,
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Container(
                      width: quizTypeState == QuizType.numQuizzes
                          ? MediaQuery.of(context).size.width *
                              (gameState.answerList.length / quizSizeState)
                          : MediaQuery.of(context).size.width *
                              (gameState.leftTime / quizTimeState),
                      height: 30,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          quizTypeState == QuizType.numQuizzes
                              ? '残り：${quizSizeState - gameState.answerList.length}問'
                              : '残り：${gameState.leftTime}秒',
                          style: TextStyle(
                            fontFeatures: [
                              FontFeature.tabularFigures(),
                            ],
                          ),
                        ),
                        const Text('／'),
                        Text(
                          '正答数：${gameState.numCorrects}',
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
                          if (keyboardLocation == 2) const SizedBox(width: 80),
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
                                        child: Text('BS'),
                                        onPressed: () {
                                          if (gameState.answer.isEmpty) {
                                            return;
                                          }
                                          gameNotifier.backSpace();
                                        },
                                      );
                                    }

                                    final isZeroBtn = index == 10;
                                    index = isZeroBtn ? -1 : index;

                                    return FigureButton(
                                      child: Text('${index + 1}'),
                                      onPressed: () {
                                        gameNotifier.fillInAnswer(index + 1);
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                          if (keyboardLocation == 1) const SizedBox(width: 80),
                        ],
                      ),
                      const Divider(height: 1, thickness: 1),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
