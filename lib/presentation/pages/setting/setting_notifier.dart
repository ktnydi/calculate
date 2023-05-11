import 'package:calculate/enums/preference.dart';
import 'package:calculate/enums/quiz_type.dart';
import 'package:calculate/enums/quiz_category_mode.dart';
import 'package:calculate/presentation/pages/setting/setting_state.dart';
import 'package:calculate/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final settingProvider =
    StateNotifierProvider.autoDispose<SettingNotifier, SettingState>(
  (ref) {
    return SettingNotifier(ref);
  },
);

class SettingNotifier extends StateNotifier<SettingState> {
  SettingNotifier(this._ref) : super(SettingState()) {
    final prefs = _ref.read(sharedPreferencesProvider);
    final quizType = QuizType.values.firstWhere(
      (value) => value.id == prefs.getInt(Preferences.quizType.key),
      orElse: () => Preferences.quizType.defaultValue,
    );
    final limit = prefs.getInt(Preferences.timeLimit.key) ??
        Preferences.timeLimit.defaultValue;
    final quizLength = prefs.getInt(Preferences.numQuizzes.key) ??
        Preferences.numQuizzes.defaultValue;
    final keyboardLocation = prefs.getInt(Preferences.keyboardLocation.key) ??
        Preferences.keyboardLocation.defaultValue;
    state = state.copyWith(
      quizType: quizType,
      limit: limit,
      quizLength: quizLength,
      keyboardLocation: keyboardLocation,
    );
  }

  final Ref _ref;

  Future<void> updateQuizCategoryMode(QuizCategoryMode mode) async {
    final prefs = _ref.read(sharedPreferencesProvider);
    await prefs.setInt('quizCategoryMode', mode.id);
  }

  Future<void> updateQuizType(QuizType quizType) async {
    final prefs = _ref.read(sharedPreferencesProvider);
    await prefs.setInt(Preferences.quizType.key, quizType.id);
    state = state.copyWith(
      quizType: quizType,
    );
  }

  Future<void> updateLimit(int limit) async {
    final prefs = _ref.read(sharedPreferencesProvider);
    await prefs.setInt(Preferences.timeLimit.key, limit);
    state = state.copyWith(
      limit: limit,
    );
  }

  Future<void> updateQuizLength(int quizLength) async {
    final prefs = _ref.read(sharedPreferencesProvider);
    await prefs.setInt(Preferences.numQuizzes.key, quizLength);
    state = state.copyWith(
      quizLength: quizLength,
    );
  }

  Future<void> updateKeyboardLocation(int keyboardLocation) async {
    final prefs = _ref.read(sharedPreferencesProvider);
    await prefs.setInt(Preferences.keyboardLocation.key, keyboardLocation);
    state = state.copyWith(
      keyboardLocation: keyboardLocation,
    );
  }
}
