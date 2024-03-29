import 'package:calculate/model/domains/quiz/quiz.dart';
import 'package:calculate/enums/quiz_category.dart';
import 'package:calculate/enums/quiz_category_mode.dart';
import 'package:calculate/model/repositories/quiz_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final quizProvider = Provider<Quiz>(
  (ref) {
    final quizCategoryModeState = ref.watch(quizCategoryModeNotifierProvider);

    QuizCategory quizCategory;
    switch (quizCategoryModeState) {
      case QuizCategoryMode.random:
        quizCategory = ([...QuizCategory.values]..shuffle()).first;
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
