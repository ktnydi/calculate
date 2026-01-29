import 'package:calculate/extensions/context.dart';
import 'package:calculate/model/use_cases/quiz_size.dart';
import 'package:calculate/presentation/pages/game/game_notifier.dart';
import 'package:calculate/providers/quiz_provider.dart';
import 'package:flutter/cupertino.dart';
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
          if (quizIndex == lastIndex) {
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
        end: const Offset(0, 0.05),
      ).animate(quizAnimation),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${quiz.figures.first}',
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w300,
                  fontFeatures: [
                    FontFeature.tabularFigures(),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Icon(quiz.type.icon, size: 32),
              const SizedBox(width: 8),
              Text(
                '${quiz.figures.last}',
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w300,
                  fontFeatures: [
                    FontFeature.tabularFigures(),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(CupertinoIcons.equal, size: 32),
              const SizedBox(width: 8),
              Container(
                width: 124,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: context.colorScheme.outlineVariant,
                  ),
                ),
                child: Center(
                  child: Text(
                    userAnswer,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 24,
                      fontFeatures: [
                        FontFeature.tabularFigures(),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 40),
            ],
          ),
        ],
      ),
    );
  }
}
