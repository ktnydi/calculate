// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Quiz _$QuizFromJson(Map<String, dynamic> json) => _Quiz(
  figures: (json['figures'] as List<dynamic>)
      .map((e) => (e as num).toInt())
      .toList(),
  type: $enumDecode(_$QuizCategoryEnumMap, json['type']),
);

Map<String, dynamic> _$QuizToJson(_Quiz instance) => <String, dynamic>{
  'figures': instance.figures,
  'type': _$QuizCategoryEnumMap[instance.type]!,
};

const _$QuizCategoryEnumMap = {
  QuizCategory.addition: 'addition',
  QuizCategory.subtraction: 'subtraction',
  QuizCategory.division: 'division',
  QuizCategory.multiplication: 'multiplication',
};
