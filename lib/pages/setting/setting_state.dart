import 'package:calculate/enums/quizType.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'setting_state.freezed.dart';

@freezed
class SettingState with _$SettingState {
  const factory SettingState({
    @Default(QuizType.numQuizzes) QuizType quizType,
    @Default(180) int limit,
    @Default(100) int quizLength,
    @Default(0) int keyboardLocation,
  }) = _SettingState;
}
