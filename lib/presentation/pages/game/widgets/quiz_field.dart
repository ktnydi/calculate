import 'dart:ui';

import 'package:calculate/enums/quiz_type.dart';
import 'package:calculate/model/use_cases/quiz_size.dart';
import 'package:calculate/presentation/pages/game/game_notifier.dart';
import 'package:calculate/providers/quiz_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuizField extends ConsumerStatefulWidget {
  const QuizField({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _QuizFieldState();
}

class _QuizFieldState extends ConsumerState<QuizField>
    with TickerProviderStateMixin {
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
    final gameNotifier = ref.watch(gameProvider.notifier);
    final quiz = ref.watch(quizProvider);
    final quizIndex = ref.watch(gameProvider.select((value) => value.index));
    final userAnswer = ref.watch(gameProvider.select((value) => value.answer));
    final quizSizeState = ref.watch(quizSizeNotifierProvider);
    final quizTypeState = ref.watch(quizTypeNotifierProvider);

    ref.listen(
      gameProvider.select((value) => int.tryParse(value.answer)),
      (previous, next) {
        if (next == null) return;
        if (next != quiz.correctAnswer) return;
        if (quizIndex == quizSizeState - 1) return;
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
          if (quizTypeState == QuizType.numQuizzes && quizIndex == lastIndex) {
            return gameNotifier.finishQuiz();
          }
          ref.invalidate(quizProvider);
          gameNotifier.clearAnswer();
          gameNotifier.nextQuiz();
        });
      },
    );

    return SlideTransition(
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
                style: Theme.of(context).textTheme.titleLarge,
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
                    userAnswer,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
