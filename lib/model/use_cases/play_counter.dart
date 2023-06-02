import 'package:calculate/providers/shared_preferences_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final playCounterNotifierProvider =
    StateNotifierProvider.autoDispose<PlayCounterNotifier, int>((ref) {
  return PlayCounterNotifier(ref);
});

class PlayCounterNotifier extends StateNotifier<int> {
  PlayCounterNotifier(this.ref) : super(0) {
    final numPlays = prefs.getInt('numPlays') ?? 0;
    state = numPlays;
  }

  final Ref ref;
  SharedPreferences get prefs => ref.read(sharedPreferencesProvider);

  void increment() {
    prefs.setInt('numPlays', state + 1);
    state += 1;
  }
}
