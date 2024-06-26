import 'package:calculate/enums/keyboard_location.dart';
import 'package:calculate/extensions/context.dart';
import 'package:calculate/model/use_cases/one_hand_keypad.dart';
import 'package:calculate/presentation/pages/game/game_notifier.dart';
import 'package:calculate/presentation/pages/game/game_page.dart';
import 'package:calculate/presentation/widgets/figure_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NumKeyboard extends ConsumerWidget {
  const NumKeyboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizType = ref.watch(quizTypeProvider);
    final oneHandKeypad = ref.watch(oneHandKeypadProvider);
    final keyboardLocation = ref.watch(keyboardLocationProvider);
    final gameNotifier = ref.watch(gameProvider(quizType).notifier);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Divider(
          height: 1,
          color: context.colorScheme.outlineVariant,
        ),
        AnimatedAlign(
          duration: const Duration(milliseconds: 200),
          alignment:
              oneHandKeypad ? keyboardLocation.alignment : Alignment.center,
          child: LayoutBuilder(builder: (context, constrains) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: oneHandKeypad
                  ? constrains.maxWidth * 0.75
                  : constrains.maxWidth,
              padding: const EdgeInsets.symmetric(horizontal: 1),
              color: context.colorScheme.outlineVariant,
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
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
                        child: const Text('C'),
                        onPressed: () {
                          gameNotifier.clearAnswer();
                        },
                      );
                    }

                    if (index == 11) {
                      return FigureButton(
                        child: const Text('BS'),
                        onPressed: () {
                          final userAnswer = ref.read(
                            gameProvider(quizType)
                                .select((value) => value.answer),
                          );
                          if (userAnswer.isEmpty) {
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
            );
          }),
        ),
        Divider(
          height: 1,
          color: context.colorScheme.outlineVariant,
        ),
      ],
    );
  }
}
