import 'package:freezed_annotation/freezed_annotation.dart';

part 'setting_state.freezed.dart';

@freezed
class SettingState with _$SettingState {
  const factory SettingState({
    @Default(false) bool isRandom,
    @Default(180) int limit,
    @Default(100) int quizLength,
  }) = _SettingState;
}
