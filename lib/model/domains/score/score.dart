import 'package:freezed_annotation/freezed_annotation.dart';

part 'score.freezed.dart';

@freezed
abstract class Score with _$Score {
  const factory Score({
    required int firstDigit,
    required int secondDigit,
    required int rawScore,
  }) = _Score;
}
