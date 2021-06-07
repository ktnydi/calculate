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
    state = state.copyWith(isRandom: isRandom);
  }

  final Reader _read;

  Future<void> updateRandom(bool isRandom) async {
    final prefs = _read(sharedPreferencesProvider);
    await prefs.setBool('isRandom', isRandom);
    state = state.copyWith(
      isRandom: isRandom,
    );
  }
}
