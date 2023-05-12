// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Quiz _$$_QuizFromJson(Map<String, dynamic> json) => _$_Quiz(
      figures: (json['figures'] as List<dynamic>).map((e) => e as int).toList(),
      type: $enumDecode(_$QuizCategoryEnumMap, json['type']),
    );

Map<String, dynamic> _$$_QuizToJson(_$_Quiz instance) => <String, dynamic>{
      'figures': instance.figures,
      'type': _$QuizCategoryEnumMap[instance.type]!,
    };

const _$QuizCategoryEnumMap = {
  QuizCategory.additional: 'additional',
  QuizCategory.subtraction: 'subtraction',
  QuizCategory.division: 'division',
  QuizCategory.multiplication: 'multiplication',
};
