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
      digitConfig: json['digitConfig'] == null
          ? const DigitConfig()
          : const DigitConfigMapConverter().fromJson(
              json['digitConfig'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$QuizSettingsToJson(
  _QuizSettings instance,
) => <String, dynamic>{
  'category': _$QuizCategoryModeEnumMap[instance.category]!,
  'size': instance.size,
  'digitConfig': const DigitConfigMapConverter().toJson(instance.digitConfig),
};

const _$QuizCategoryModeEnumMap = {
  QuizCategoryMode.multiplication: 'multiplication',
  QuizCategoryMode.division: 'division',
  QuizCategoryMode.addition: 'addition',
  QuizCategoryMode.subtraction: 'subtraction',
  QuizCategoryMode.random: 'random',
};
