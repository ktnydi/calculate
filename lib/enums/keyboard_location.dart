import 'package:calculate/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final keyboardLocationProvider =
    StateNotifierProvider<KeyboardLocationNotifier, KeyboardLocation>(
  (ref) {
    return KeyboardLocationNotifier(ref);
  },
);

class KeyboardLocationNotifier extends StateNotifier<KeyboardLocation> {
  KeyboardLocationNotifier(this.ref) : super(KeyboardLocation.center) {
    final id = prefs.getInt(key);
    if (id == null) return;
    state = KeyboardLocation.values.firstWhere(
      (element) => element.id == id,
      orElse: () => KeyboardLocation.center,
    );
  }

  final key = 'keyboardLocation';
  final Ref ref;
  SharedPreferences get prefs => ref.read(sharedPreferencesProvider);

  void change(KeyboardLocation location) {
    state = location;
    prefs.setInt(key, location.id);
  }
}

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
