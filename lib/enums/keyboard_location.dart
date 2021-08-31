import 'package:calculate/enums/preference.dart';
import 'package:calculate/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final keyboardLocationProvider = StateProvider<KeyboardLocation>(
  (ref) {
    final prefs = ref.read(sharedPreferencesProvider);
    return KeyboardLocation.values.firstWhere(
      (value) {
        return value.id == prefs.getInt(Preferences.keyboardLocation.key);
      },
      orElse: () => KeyboardLocation.center,
    );
  },
);

enum KeyboardLocation {
  center,
  left,
  right,
}

extension KeyboardLocationEx on KeyboardLocation {
  int get id {
    switch (this) {
      case KeyboardLocation.center:
        return 0;
      case KeyboardLocation.left:
        return 1;
      case KeyboardLocation.right:
        return 2;
    }
  }

  String get name {
    switch (this) {
      case KeyboardLocation.center:
        return '標準';
      case KeyboardLocation.left:
        return '左';
      case KeyboardLocation.right:
        return '右';
    }
  }
}
