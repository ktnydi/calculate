// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuizSettings _$QuizSettingsFromJson(Map<String, dynamic> json) =>
    _QuizSettings(
      category:
          $enumDecodeNullable(
            _$QuizCategoryModeEnumMap,
            json['category'],
            unknownValue: QuizCategoryMode.random,
          ) ??
          QuizCategoryMode.random,
      size: (json['size'] as num?)?.toInt() ?? 10,
    );

Map<String, dynamic> _$QuizSettingsToJson(_QuizSettings instance) =>
    <String, dynamic>{
      'category': _$QuizCategoryModeEnumMap[instance.category]!,
      'size': instance.size,
    };

const _$QuizCategoryModeEnumMap = {
  QuizCategoryMode.multiplication: 'multiplication',
  QuizCategoryMode.division: 'division',
  QuizCategoryMode.additional: 'additional',
  QuizCategoryMode.subtraction: 'subtraction',
  QuizCategoryMode.random: 'random',
};
