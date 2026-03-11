import 'package:freezed_annotation/freezed_annotation.dart';

part 'digit_config.freezed.dart';
part 'digit_config.g.dart';

@freezed
abstract class DigitConfig with _$DigitConfig {
  const factory DigitConfig({
    @Default(Digit()) @DigitMapConverter() Digit addition,
    @Default(Digit()) @DigitMapConverter() Digit subtraction,
    @Default(Digit()) @DigitMapConverter() Digit division,
    @Default(Digit()) @DigitMapConverter() Digit multiplication,
  }) = _DigitConfig;

  factory DigitConfig.fromJson(Map<String, dynamic> json) =>
      _$DigitConfigFromJson(json);
}

class DigitConfigMapConverter
    implements JsonConverter<DigitConfig, Map<String, dynamic>> {
  const DigitConfigMapConverter();

  @override
  DigitConfig fromJson(Map<String, dynamic> json) {
    return DigitConfig.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(DigitConfig object) {
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
