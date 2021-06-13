import 'package:calculate/enums/quizType.dart';
import 'package:calculate/pages/setting/setting_state.dart';
import 'package:calculate/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final settingProvider =
    StateNotifierProvider.autoDispose<SettingNotifier, SettingState>(
  (ref) {
    return SettingNotifier(ref.read);
  },
);

class SettingNotifier extends StateNotifier<SettingState> {
  SettingNotifier(this._read) : super(SettingState()) {
    final prefs = _read(sharedPreferencesProvider);
    final quizType = QuizType.values.firstWhere(
      (value) => value.id == prefs.getInt('quizType'),
      orElse: () => QuizType.numQuizzes,
    );
    final limit = prefs.getInt('limit') ?? 180;
    final quizLength = prefs.getInt('quizLength') ?? 100;
    final keyboardLocation = prefs.getInt('keyboardLocation') ?? 0;
    state = state.copyWith(
      quizType: quizType,
      limit: limit,
      quizLength: quizLength,
      keyboardLocation: keyboardLocation,
    );
  }

  final Reader _read;

  Future<void> updateQuizType(QuizType quizType) async {
    final prefs = _read(sharedPreferencesProvider);
    await prefs.setInt('quizType', quizType.id);
    state = state.copyWith(
      quizType: quizType,
    );
  }

  Future<void> updateLimit(int limit) async {
    final prefs = _read(sharedPreferencesProvider);
    await prefs.setInt('limit', limit);
    state = state.copyWith(
      limit: limit,
    );
  }

  Future<void> updateQuizLength(int quizLength) async {
    final prefs = _read(sharedPreferencesProvider);
    await prefs.setInt('quizLength', quizLength);
    state = state.copyWith(
      quizLength: quizLength,
    );
  }

  Future<void> updateKeyboardLocation(int keyboardLocation) async {
    final prefs = _read(sharedPreferencesProvider);
    await prefs.setInt('keyboardLocation', keyboardLocation);
    state = state.copyWith(
      keyboardLocation: keyboardLocation,
    );
  }
}
