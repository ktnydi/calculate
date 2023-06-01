import 'dart:ui';

import 'package:calculate/enums/quiz_type.dart';
import 'package:calculate/model/use_cases/quiz_size.dart';
import 'package:calculate/presentation/pages/game/game_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppBarTitle extends ConsumerWidget {
  const AppBarTitle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizIndex = ref.watch(gameProvider.select((value) => value.index));
    final quizSizeState = ref.watch(quizSizeNotifierProvider);
    final quizTypeState = ref.watch(quizTypeNotifierProvider);

    return Text(
      quizTypeState == QuizType.numQuizzes
          ? '${quizIndex + 1}／${quizSizeState}問'
          : '第${quizIndex + 1}問',
      style: TextStyle(
        fontSize: 18,
        fontFeatures: [
          FontFeature.tabularFigures(),
        ],
      ),
    );
  }
}
