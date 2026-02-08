import 'package:calculate/enums/quiz_category_mode.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_settings.freezed.dart';
part 'quiz_settings.g.dart';

@freezed
abstract class QuizSettings with _$QuizSettings {
  // dart format off
  const factory QuizSettings({
    // ignore: invalid_annotation_target
    @Default(QuizCategoryMode.random) @JsonKey(unknownEnumValue: QuizCategoryMode.random) QuizCategoryMode category,
    @Default(10) int size,
  }) = _QuizSettings;
  // dart format on

  factory QuizSettings.fromJson(Map<String, dynamic> json) =>
      _$QuizSettingsFromJson(json);
}
