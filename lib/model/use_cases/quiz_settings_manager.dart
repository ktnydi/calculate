import 'dart:convert';

import 'package:calculate/enums/quiz_category.dart';
import 'package:calculate/enums/quiz_category_mode.dart';
import 'package:calculate/model/domains/quiz_settings/quiz_settings.dart';
import 'package:calculate/model/domains/quiz_settings/term_settings.dart';
import 'package:calculate/providers/shared_preferences_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum QuizSettingsKey {
  mode,
  quantity,
  term;

  const QuizSettingsKey();
}

final quizSettingsManagerNotifierProvider =
    StateNotifierProvider.autoDispose<
      QuizSettingsManagerNotifier,
      QuizSettings
    >((ref) {
      return QuizSettingsManagerNotifier(ref);
    });

class QuizSettingsManagerNotifier extends StateNotifier<QuizSettings> {
  QuizSettingsManagerNotifier(this.ref) : super(QuizSettings()) {
    initialize();
  }

  final Ref ref;

  SharedPreferences get prefs => ref.read(sharedPreferencesProvider);

  void initialize() {
    final modeNames = prefs.getStringList(QuizSettingsKey.mode.name);
    final quantity = prefs.getInt(QuizSettingsKey.quantity.name);
    final term = prefs.getString(QuizSettingsKey.term.name);

    if (modeNames != null) {
      final modes = modeNames
          .map((value) => QuizCategory.values.byName(value))
          .toList();

      final category = QuizCategoryMode.values.firstWhere(
        (value) => listEquals(value.categories, modes),
      );

      state = state.copyWith(category: category);
    }

    if (quantity != null) {
      state = state.copyWith(size: quantity);
    }

    if (term != null) {
      final termJson = jsonDecode(term) as Map<String, dynamic>;

      state = state.copyWith(term: Term.fromJson(termJson));
    }
  }

  Future<void> updateQuizCategory(QuizCategoryMode category) async {
    final newState = state.copyWith(category: category);

    state = newState;
    await prefs.setStringList(
      QuizSettingsKey.mode.name,
      category.categories.map((value) => value.name).toList(),
    );
  }

  Future<void> updateQuizSize(int size) async {
    final newState = state.copyWith(size: size);

    state = newState;
    await prefs.setInt(QuizSettingsKey.quantity.name, size);
  }

  Future<void> updateTerm(Term term) async {
    state = state.copyWith(term: term);

    await prefs.setString(
      QuizSettingsKey.term.name,
      jsonEncode(term.toJson()),
    );
  }
}
