import 'dart:math';

import 'package:calculate/domains/quiz/quiz.dart';
import 'package:calculate/enums/quiz_category.dart';
import 'package:calculate/enums/quiz_category_mode.dart';
import 'package:calculate/repositories/quiz_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final quizProvider = FutureProvider<Quiz>(
  (ref) async {
    final quizCategoryMode = ref.watch(quizCategoryModeProvider);

    QuizCategory quizCategory;

    switch (quizCategoryMode) {
      case QuizCategoryMode.random:
        final random = Random();
        quizCategory = QuizCategory.values.firstWhere(
          (value) => value.index == random.nextInt(5),
          orElse: () => QuizCategory.additional,
        );
        break;
      case QuizCategoryMode.add:
        quizCategory = QuizCategory.additional;
        break;
      case QuizCategoryMode.subtraction:
        quizCategory = QuizCategory.subtraction;
        break;
      case QuizCategoryMode.division:
        quizCategory = QuizCategory.division;
        break;
      case QuizCategoryMode.multiplication:
        quizCategory = QuizCategory.multiplication;
        break;
    }

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
