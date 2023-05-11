import 'package:calculate/model/domains/quiz/quiz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'answer.freezed.dart';

@freezed
class Answer with _$Answer {
  const factory Answer({
    required Quiz quiz,
    required String answer,
    required bool isCorrect,
  }) = _Answer;
}
