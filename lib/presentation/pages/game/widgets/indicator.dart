import 'dart:ui';

import 'package:calculate/enums/quiz_type.dart';
import 'package:calculate/extensions/num.dart';
import 'package:calculate/model/use_cases/quiz_size.dart';
import 'package:calculate/model/use_cases/quiz_time.dart';
import 'package:calculate/presentation/pages/game/game_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Indicator extends ConsumerWidget {
  const Indicator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameState = ref.watch(gameProvider);
    final quizTypeState = ref.watch(quizTypeNotifierProvider);
    final quizTimeState = ref.watch(quizTimeNotifierProvider) * 1000;
    final quizSizeState = ref.watch(quizSizeNotifierProvider);

    return Container(
      color: Colors.grey.shade200,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 10),
            width: quizTypeState == QuizType.numQuizzes
                ? MediaQuery.of(context).size.width *
                    (gameState.answerList.length / quizSizeState)
                : MediaQuery.of(context).size.width *
                    (gameState.time / quizTimeState),
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
                    : '残り：${((quizTimeState - gameState.time) / 1000).digit()}秒',
                style: const TextStyle(
                  fontFeatures: [
                    FontFeature.tabularFigures(),
                  ],
                ),
              ),
              const Text('／'),
              Text(
                '正答数：${gameState.numCorrects}',
                style: const TextStyle(
                  fontFeatures: [
                    FontFeature.tabularFigures(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
