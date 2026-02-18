import 'package:freezed_annotation/freezed_annotation.dart';

part 'term_settings.freezed.dart';
part 'term_settings.g.dart';

@freezed
abstract class Term with _$Term {
  const factory Term({
    @Default(Digit()) @DigitMapConverter() Digit additional,
    @Default(Digit()) @DigitMapConverter() Digit subtraction,
    @Default(Digit()) @DigitMapConverter() Digit division,
    @Default(Digit()) @DigitMapConverter() Digit multiplication,
  }) = _Term;

  factory Term.fromJson(Map<String, dynamic> json) => _$TermFromJson(json);
}

class TermMapConverter implements JsonConverter<Term, Map<String, dynamic>> {
  const TermMapConverter();

  @override
  Term fromJson(Map<String, dynamic> json) {
    return Term.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(Term object) {
    return object.toJson();
  }
}

@freezed
abstract class Digit with _$Digit {
  const factory Digit({
    @Default(2) int first,
    @Default(2) int second,
  }) = _Digit;

  factory Digit.fromJson(Map<String, dynamic> json) => _$DigitFromJson(json);
}

class DigitMapConverter implements JsonConverter<Digit, Map<String, dynamic>> {
  const DigitMapConverter();

  @override
  Digit fromJson(Map<String, dynamic> json) {
    return Digit.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(Digit object) {
    return object.toJson();
  }
}
