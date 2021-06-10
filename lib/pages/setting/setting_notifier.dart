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
    final isRandom = prefs.getBool('isRandom') ?? false;
    final limit = prefs.getInt('limit') ?? 180;
    final quizLength = prefs.getInt('quizLength') ?? 100;
    final keyboardLocation = prefs.getInt('keyboardLocation') ?? 0;
    state = state.copyWith(
      isRandom: isRandom,
      limit: limit,
      quizLength: quizLength,
      keyboardLocation: keyboardLocation,
    );
  }

  final Reader _read;

  Future<void> updateRandom(bool isRandom) async {
    final prefs = _read(sharedPreferencesProvider);
    await prefs.setBool('isRandom', isRandom);
    state = state.copyWith(
      isRandom: isRandom,
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
