import 'package:calculate/model/domains/quiz/quiz.dart';
import 'package:calculate/enums/quiz_category.dart';
import 'package:calculate/model/repositories/quiz_repository.dart';
import 'package:calculate/model/use_cases/quiz_settings_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final quizProvider = Provider<Quiz>(
  (ref) {
    final currentCategory = ref.watch(
      quizSettingsManagerNotifierProvider.select((value) => value.category),
    );

    final quizCategory = ([...currentCategory.categories]..shuffle()).first;

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
