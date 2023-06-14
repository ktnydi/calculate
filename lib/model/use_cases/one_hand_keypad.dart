import 'package:calculate/providers/shared_preferences_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final oneHandKeypadProvider =
    StateNotifierProvider<OneHandKeypadNotifier, bool>((ref) {
  return OneHandKeypadNotifier(ref);
});

class OneHandKeypadNotifier extends StateNotifier<bool> {
  OneHandKeypadNotifier(this.ref) : super(false) {
    final isOneHandKeypad = prefs.getBool(key) ?? false;
    state = isOneHandKeypad;
  }

  final key = 'isOneHandKeypad';
  final Ref ref;
  SharedPreferences get prefs => ref.read(sharedPreferencesProvider);

  void update(bool isOn) {
    prefs.setBool(key, isOn);
    state = isOn;
  }
}
