import 'package:calculate/enums/quiz_type.dart';
import 'package:calculate/extensions/context.dart';
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
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      color: Colors.grey.shade200,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 10),
            width: quizTypeState == QuizType.numQuizzes
                ? screenWidth * (gameState.answerList.length / quizSizeState)
                : screenWidth * (gameState.time / quizTimeState),
            height: 8,
            decoration: BoxDecoration(
              color: context.colorScheme.primary,
              borderRadius: const BorderRadius.horizontal(
                right: Radius.circular(1000),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
