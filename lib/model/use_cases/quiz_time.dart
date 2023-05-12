import 'package:calculate/providers/shared_preferences_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final quizTimeNotifierProvider =
    StateNotifierProvider<QuizTimeNotifier, int>((ref) {
  return QuizTimeNotifier(ref);
});

class QuizTimeNotifier extends StateNotifier<int> {
  QuizTimeNotifier(this.ref) : super(60) {
    final time = prefs.getInt(key);
    if (time == null) return;
    state = time;
  }

  final key = 'limit';
  final Ref ref;
  SharedPreferences get prefs => ref.read(sharedPreferencesProvider);

  void change({required int time}) {
    state = time;
    prefs.setInt(key, time);
  }
}
