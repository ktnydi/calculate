import 'dart:ui';

import 'package:calculate/enums/supported_locale.dart';
import 'package:calculate/providers/shared_preferences_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final localeNotifierProvider =
    StateNotifierProvider<LocaleNotifier, SupportedLocale>((ref) {
  return LocaleNotifier(ref);
});

class LocaleNotifier extends StateNotifier<SupportedLocale> {
  LocaleNotifier(this.ref) : super(SupportedLocale.fromLocale(window.locale)) {
    final languageCode = prefs.getString(key);
    if (languageCode == null) return;
    state = SupportedLocale.fromLocale(Locale(languageCode));
  }

  final key = 'languageCode';
  final Ref ref;
  SharedPreferences get prefs => ref.read(sharedPreferencesProvider);

  void change(SupportedLocale locale) {
    prefs.setString(key, locale.name);
    state = locale;
  }
}
