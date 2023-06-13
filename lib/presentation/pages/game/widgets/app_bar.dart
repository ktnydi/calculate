import 'dart:ui';

import 'package:calculate/presentation/pages/game/game_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';

class AppBarTitle extends ConsumerWidget {
  const AppBarTitle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizIndex = ref.watch(gameProvider.select((value) => value.index));

    return Text(
      L10n.of(context)!.currentQuizNumber(quizIndex + 1),
      style: const TextStyle(
        fontSize: 18,
        fontFeatures: [
          FontFeature.tabularFigures(),
        ],
      ),
    );
  }
}
