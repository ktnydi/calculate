import 'package:calculate/pages/setting/setting_state.dart';
import 'package:calculate/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final settingProvider =
    StateNotifierProvider.autoDispose<SettingNotifier, SettingState>(
  (ref) {
    return SettingNotifier(ref.read);
  },
);

class SettingNotifier extends StateNotifier<SettingState> {
  SettingNotifier(this._read) : super(SettingState()) {
    final prefs = _read(sharedPreferencesProvider);
    final isRandom = prefs.getBool('isRandom') ?? false;
    final limit = prefs.getInt('limit') ?? 180;
    state = state.copyWith(
      isRandom: isRandom,
      limit: limit,
    );
  }

  final Reader _read;

  Future<void> updateRandom(bool isRandom) async {
    final prefs = _read(sharedPreferencesProvider);
    await prefs.setBool('isRandom', isRandom);
    state = state.copyWith(
      isRandom: isRandom,
    );
  }

  Future<void> updateLimit(int limit) async {
    final prefs = _read(sharedPreferencesProvider);
    await prefs.setInt('limit', limit);
    state = state.copyWith(
      limit: limit,
    );
  }
}
