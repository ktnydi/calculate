import 'package:calculate/model/domains/answer/answer.dart';
import 'package:calculate/model/domains/quiz/quiz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_state.freezed.dart';

@freezed
class GameState with _$GameState {
  const GameState._();

  const factory GameState({
    @Default([]) List<Quiz> figuresList,
    @Default(0) int index,
    @Default('') String answer,
    @Default([]) List<Answer> answerList,
    @Default(0) int time,
    @Default(false) bool isFinished,
    @Default(false) bool isRetired,
  }) = _GameState;
}
