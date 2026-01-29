import 'package:calculate/extensions/context.dart';
import 'package:calculate/model/use_cases/one_hand_keypad.dart';
import 'package:calculate/model/use_cases/play_counter.dart';
import 'package:calculate/presentation/pages/game/game_notifier.dart';
import 'package:calculate/presentation/pages/game/widgets/app_bar.dart';
import 'package:calculate/presentation/pages/game/widgets/indicator.dart';
import 'package:calculate/presentation/pages/game/widgets/keypad_position_button.dart';
import 'package:calculate/presentation/pages/game/widgets/num_keyboard.dart';
import 'package:calculate/presentation/pages/game/widgets/quiz_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class Game extends ConsumerWidget {
  const Game({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final oneHandKeypad = ref.watch(oneHandKeypadProvider);

    ref.listen(
      gameProvider,
      (previous, next) {
        if (!next.isFinished) return;

        if (!next.isRetired && next.answerList.isNotEmpty) {
          ref.read(playCounterNotifierProvider.notifier).increment();
        }

        context.go('/game/result', extra: next.answerList);
      },
    );

    return Stack(
      children: [
        PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) {
            if (didPop) return;
          },
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
