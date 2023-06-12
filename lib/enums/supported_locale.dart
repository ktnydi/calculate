import 'package:flutter/material.dart';

enum SupportedLocale {
  en('English'),
  ja('日本語'),
  ;

  const SupportedLocale(this.label);

  final String label;

  Locale toLocale() => Locale(name);

  static SupportedLocale fromLocale(Locale locale) {
    return values.firstWhere(
      (element) => element.name == locale.languageCode,
      orElse: () => SupportedLocale.en,
    );
  }
}
