import 'package:calculate/l10n/l10n.dart';
import 'package:calculate/model/use_cases/one_hand_keypad.dart';
import 'package:calculate/presentation/pages/game/game_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class GameAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const GameAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizIndex = ref.watch(gameProvider.select((value) => value.index));
    final oneHandKeypad = ref.watch(oneHandKeypadProvider);
    final oneHandKeypadNotifier = ref.watch(oneHandKeypadProvider.notifier);

    return AppBar(
      leading: CloseButton(
        onPressed: () {
          if (quizIndex == 0) {
            context.go('/');
            return;
          }

          ref.read(gameProvider.notifier).retiredQuiz();
        },
      ),
      title: Text(
        L10n.of(context)!.currentQuizNumber(quizIndex + 1),
        style: const TextStyle(
          fontSize: 18,
          fontFeatures: [
            FontFeature.tabularFigures(),
          ],
        ),
      ),
      actions: [
        if (oneHandKeypad)
          IconButton(
            onPressed: () {
              HapticFeedback.lightImpact();
              oneHandKeypadNotifier.update(false);
            },
            icon: const Icon(Icons.open_in_full),
          )
        else
          IconButton(
            onPressed: () {
              HapticFeedback.lightImpact();
              oneHandKeypadNotifier.update(true);
            },
            icon: const Icon(Icons.close_fullscreen),
          ),
      ],
    );
  }
}
