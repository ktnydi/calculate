import 'package:calculate/providers.dart';
import 'package:flutter/material.dart';
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
  center(0, '標準', Alignment.bottomCenter),
  left(1, '左', Alignment.bottomLeft),
  right(2, '右', Alignment.bottomRight),
  ;

  const KeyboardLocation(this.id, this.name, this.alignment);

  final int id;
  final String name;
  final AlignmentGeometry alignment;
}
