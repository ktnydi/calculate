import 'package:calculate/enums/preference.dart';
import 'package:calculate/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final quizTypeProvider = StateProvider<QuizType>(
  (ref) {
    final prefs = ref.read(sharedPreferencesProvider);
    return QuizType.values.firstWhere(
      (value) {
        return value.id == prefs.getInt(Preferences.quizType.key);
      },
      orElse: () => QuizType.numQuizzes,
    );
  },
);

enum QuizType {
  /// 時間制限
  timeLimit,

  /// 問題数
  numQuizzes,
}

extension QuizTypeEx on QuizType {
  int get id {
    switch (this) {
      case QuizType.timeLimit:
        return 0;
      case QuizType.numQuizzes:
        return 1;
    }
  }

  String get name {
    switch (this) {
      case QuizType.timeLimit:
        return '時間制限';
      case QuizType.numQuizzes:
        return '問題数';
    }
  }
}
