import 'package:calculate/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final quizCategoryModeNotifierProvider =
    StateNotifierProvider<QuizCategoryModeNotifier, QuizCategoryMode>(
  (ref) {
    return QuizCategoryModeNotifier(ref);
  },
);

class QuizCategoryModeNotifier extends StateNotifier<QuizCategoryMode> {
  QuizCategoryModeNotifier(this.ref) : super(QuizCategoryMode.random) {
    final id = prefs.getInt(key);
    if (id == null) return;
    state = QuizCategoryMode.values.firstWhere(
      (element) => element.id == id,
      orElse: () => QuizCategoryMode.random,
    );
  }

  final Ref ref;
  SharedPreferences get prefs => ref.read(sharedPreferencesProvider);
  final key = 'quizCategoryMode';

  void change(QuizCategoryMode mode) {
    state = mode;
    prefs.setInt(key, mode.id);
  }
}

enum QuizCategoryMode {
  random,
  add,
  subtraction,
  division,
  multiplication,
  ;
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
}
