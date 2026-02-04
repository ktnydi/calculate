import 'package:calculate/enums/quiz_category_mode.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_settings.freezed.dart';
part 'quiz_settings.g.dart';

@freezed
abstract class QuizSettings with _$QuizSettings {
  const factory QuizSettings({
    @Default(QuizCategoryMode.random) QuizCategoryMode category,
    @Default(10) int size,
  }) = _QuizSettings;

  factory QuizSettings.fromJson(Map<String, dynamic> json) =>
      _$QuizSettingsFromJson(json);
}
