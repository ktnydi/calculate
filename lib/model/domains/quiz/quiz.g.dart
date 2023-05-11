// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Quiz _$_$_QuizFromJson(Map<String, dynamic> json) {
  return _$_Quiz(
    figures: (json['figures'] as List<dynamic>).map((e) => e as int).toList(),
    type: _$enumDecode(_$QuizCategoryEnumMap, json['type']),
  );
}

Map<String, dynamic> _$_$_QuizToJson(_$_Quiz instance) => <String, dynamic>{
      'figures': instance.figures,
      'type': _$QuizCategoryEnumMap[instance.type],
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$QuizCategoryEnumMap = {
  QuizCategory.additional: 'additional',
  QuizCategory.subtraction: 'subtraction',
  QuizCategory.division: 'division',
  QuizCategory.multiplication: 'multiplication',
};
