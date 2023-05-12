import 'package:calculate/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final quizTypeNotifierProvider =
    StateNotifierProvider<QuizTypeNotifier, QuizType>((ref) {
  return QuizTypeNotifier(ref);
});

class QuizTypeNotifier extends StateNotifier<QuizType> {
  QuizTypeNotifier(this.ref) : super(QuizType.numQuizzes) {
    final id = prefs.getInt(key);
    if (id == null) return;
    state = QuizType.values.firstWhere(
      (element) => element.id == id,
      orElse: () => QuizType.numQuizzes,
    );
  }

  final key = 'quizType';
  final Ref ref;
  SharedPreferences get prefs => ref.read(sharedPreferencesProvider);

  void change(QuizType type) {
    state = type;
    prefs.setInt(key, type.id);
  }
}

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
