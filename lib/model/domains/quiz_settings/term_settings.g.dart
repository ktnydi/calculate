// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'term_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Term _$TermFromJson(Map<String, dynamic> json) => _Term(
  addition: json['addition'] == null
      ? const Digit()
      : const DigitMapConverter().fromJson(
          json['addition'] as Map<String, dynamic>,
        ),
  subtraction: json['subtraction'] == null
      ? const Digit()
      : const DigitMapConverter().fromJson(
          json['subtraction'] as Map<String, dynamic>,
        ),
  division: json['division'] == null
      ? const Digit()
      : const DigitMapConverter().fromJson(
          json['division'] as Map<String, dynamic>,
        ),
  multiplication: json['multiplication'] == null
      ? const Digit()
      : const DigitMapConverter().fromJson(
          json['multiplication'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$TermToJson(_Term instance) => <String, dynamic>{
  'addition': const DigitMapConverter().toJson(instance.addition),
  'subtraction': const DigitMapConverter().toJson(instance.subtraction),
  'division': const DigitMapConverter().toJson(instance.division),
  'multiplication': const DigitMapConverter().toJson(instance.multiplication),
};

_Digit _$DigitFromJson(Map<String, dynamic> json) => _Digit(
  first: (json['first'] as num?)?.toInt() ?? 2,
  second: (json['second'] as num?)?.toInt() ?? 2,
);

Map<String, dynamic> _$DigitToJson(_Digit instance) => <String, dynamic>{
  'first': instance.first,
  'second': instance.second,
};
