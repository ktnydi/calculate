import 'dart:convert';

import 'package:calculate/enums/quiz_category_mode.dart';
import 'package:calculate/model/domains/quiz_settings/quiz_settings.dart';
import 'package:calculate/providers/shared_preferences_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final quizSettingsManagerNotifierProvider =
    StateNotifierProvider.autoDispose<
      QuizSettingsManagerNotifier,
      QuizSettings
    >((ref) {
      return QuizSettingsManagerNotifier(ref);
    });

class QuizSettingsManagerNotifier extends StateNotifier<QuizSettings> {
  QuizSettingsManagerNotifier(this.ref) : super(QuizSettings()) {
    final quizSettingsString = prefs.getString(key);
    if (quizSettingsString == null) return;
    final json = jsonDecode(quizSettingsString) as Map<String, dynamic>;
    state = QuizSettings.fromJson(json);
  }

  final Ref ref;
  final key = 'quiz_settings.json';

  SharedPreferences get prefs => ref.read(sharedPreferencesProvider);

  Future<void> updateQuizCategory(QuizCategoryMode category) async {
    final newState = state.copyWith(category: category);

    state = newState;
    await prefs.setString(key, jsonEncode(newState.toJson()));
  }

  Future<void> updateQuizSize(int size) async {
    final newState = state.copyWith(size: size);

    state = newState;
    await prefs.setString(key, jsonEncode(newState.toJson()));
  }
}
