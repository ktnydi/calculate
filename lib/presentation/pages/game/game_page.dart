import 'package:calculate/model/use_cases/play_counter.dart';
import 'package:calculate/model/use_cases/quiz_time.dart';
import 'package:calculate/presentation/pages/game/game_notifier.dart';
import 'package:calculate/presentation/pages/game/widgets/app_bar.dart';
import 'package:calculate/presentation/pages/game/widgets/indicator.dart';
import 'package:calculate/presentation/pages/game/widgets/num_keyboard.dart';
import 'package:calculate/presentation/pages/game/widgets/quiz_field.dart';
import 'package:calculate/presentation/pages/game_result/game_result_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Game extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      gameProvider,
      (previous, next) {
        if (!next.isFinished) return;

        final quizTimeState = ref.read(quizTimeNotifierProvider) * 1000;

        if (!next.isRetired) {
          ref.read(playCounterNotifierProvider.notifier).increment();
        }

        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 500),
            pageBuilder: (context, animation, _) {
              return GameResult(
                quizTimeState - next.time,
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
                ref.read(gameProvider.notifier).retiredQuiz();
              },
            ),
            title: AppBarTitle(),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Center(
                  child: QuizField(),
                ),
              ),
              const Divider(height: 1, thickness: 1),
              Indicator(),
              Container(
                color: Colors.white,
                child: SafeArea(
                  child: NumKeyboard(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
