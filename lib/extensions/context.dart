import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  Color get dividerColor {
    return Theme.of(this).useMaterial3
        ? colorScheme.outlineVariant
        : Theme.of(this).dividerColor;
  }

  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}
