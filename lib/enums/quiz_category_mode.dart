import 'package:calculate/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final quizCategoryModeProvider = StateProvider<QuizCategoryMode>(
  (ref) {
    final prefs = ref.read(sharedPreferencesProvider);
    return QuizCategoryMode.values.firstWhere(
      (value) {
        return value.id == prefs.getInt('quizCategoryMode');
      },
      orElse: () => QuizCategoryMode.random,
    );
  },
);

enum QuizCategoryMode {
  random,
  add,
  subtraction,
  division,
  multiplication,
}

extension QuizCategoryModeEx on QuizCategoryMode {
  int get id {
    switch (this) {
      case QuizCategoryMode.random:
        return 0;
      case QuizCategoryMode.add:
        return 1;
      case QuizCategoryMode.subtraction:
        return 2;
      case QuizCategoryMode.division:
        return 3;
      case QuizCategoryMode.multiplication:
        return 4;
    }
  }

  String get name {
    switch (this) {
      case QuizCategoryMode.random:
        return 'ランダム';
      case QuizCategoryMode.add:
        return '足し算';
      case QuizCategoryMode.subtraction:
        return '引き算';
      case QuizCategoryMode.division:
        return '割り算';
      case QuizCategoryMode.multiplication:
        return '掛け算';
    }
  }
}
