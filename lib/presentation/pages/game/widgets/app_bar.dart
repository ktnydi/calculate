import 'dart:ui';

import 'package:calculate/presentation/pages/game/game_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppBarTitle extends ConsumerWidget {
  const AppBarTitle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizIndex = ref.watch(gameProvider.select((value) => value.index));

    return Text(
      '第${quizIndex + 1}問',
      style: const TextStyle(
        fontSize: 18,
        fontFeatures: [
          FontFeature.tabularFigures(),
        ],
      ),
    );
  }
}
