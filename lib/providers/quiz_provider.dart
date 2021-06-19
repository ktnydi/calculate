import 'dart:math';

import 'package:calculate/domains/quiz/quiz.dart';
import 'package:calculate/enums/quiz_category.dart';
import 'package:calculate/repositories/quiz_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final quizProvider = FutureProvider<Quiz>(
  (ref) async {
    final random = Random();
    final quizCategory = QuizCategory.values.firstWhere(
      (value) => value.index == random.nextInt(5),
      orElse: () => QuizCategory.additional,
    );
    switch (quizCategory) {
      case QuizCategory.additional:
        return ref.read(quizRepositoryProvider).getAdditional();
      case QuizCategory.subtraction:
        return ref.read(quizRepositoryProvider).getSubtraction();
      case QuizCategory.division:
        return ref.read(quizRepositoryProvider).getDivision();
      case QuizCategory.multiplication:
        return ref.read(quizRepositoryProvider).getMultiplication();
    }
  },
);
