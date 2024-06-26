import 'package:calculate/enums/quiz_type.dart';
import 'package:calculate/extensions/context.dart';
import 'package:calculate/model/use_cases/one_hand_keypad.dart';
import 'package:calculate/model/use_cases/play_counter.dart';
import 'package:calculate/model/use_cases/quiz_time.dart';
import 'package:calculate/presentation/pages/game/game_notifier.dart';
import 'package:calculate/presentation/pages/game/widgets/app_bar.dart';
import 'package:calculate/presentation/pages/game/widgets/indicator.dart';
import 'package:calculate/presentation/pages/game/widgets/keypad_position_button.dart';
import 'package:calculate/presentation/pages/game/widgets/num_keyboard.dart';
import 'package:calculate/presentation/pages/game/widgets/quiz_field.dart';
import 'package:calculate/presentation/pages/game_result/game_result_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final quizTypeProvider = Provider<QuizType>(
  (ref) => throw UnimplementedError(),
);

class Game extends ConsumerWidget {
  const Game({
    super.key,
    required this.quizType,
  });

  final QuizType quizType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final oneHandKeypad = ref.watch(oneHandKeypadProvider);

    ref.listen(
      gameProvider(quizType),
      (previous, next) {
        if (!next.isFinished) return;

        final quizTimeState = ref.read(quizTimeNotifierProvider) * 1000;

        if (!next.isRetired && next.answerList.isNotEmpty) {
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
                quizType,
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
        ProviderScope(
          overrides: [
            quizTypeProvider.overrideWithValue(quizType),
          ],
          child: Scaffold(
            backgroundColor: context.colorScheme.surface,
            appBar: const GameAppBar(),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Indicator(),
                Expanded(
                  child: Stack(
                    children: [
                      const Center(
                        child: QuizField(),
                      ),
                      if (oneHandKeypad)
                        const Positioned(
                          bottom: 0,
                          right: 0,
                          left: 0,
                          child: KeypadPositionButton(),
                        ),
                    ],
                  ),
                ),
                Container(
                  color: context.colorScheme.surface,
                  child: const SafeArea(
                    child: NumKeyboard(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
