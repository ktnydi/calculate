import 'package:calculate/providers/shared_preferences_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final quizSizeNotifierProvider =
    StateNotifierProvider<QuizSizeNotifier, int>((ref) {
  return QuizSizeNotifier(ref);
});

class QuizSizeNotifier extends StateNotifier<int> {
  QuizSizeNotifier(this.ref) : super(10) {
    final size = prefs.getInt(key);
    if (size == null) return;
    state = size;
  }

  final key = 'quizLength';
  final Ref ref;
  SharedPreferences get prefs => ref.read(sharedPreferencesProvider);

  void change(int size) {
    state = size;
    prefs.setInt(key, size);
  }
}
