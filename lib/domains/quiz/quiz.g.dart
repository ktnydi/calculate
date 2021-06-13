// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Quiz _$_$_QuizFromJson(Map<String, dynamic> json) {
  return _$_Quiz(
    figures: (json['figures'] as List<dynamic>).map((e) => e as int).toList(),
    type: json['type'] as int,
  );
}

Map<String, dynamic> _$_$_QuizToJson(_$_Quiz instance) => <String, dynamic>{
      'figures': instance.figures,
      'type': instance.type,
    };
