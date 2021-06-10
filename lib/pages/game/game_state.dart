import 'package:calculate/domains/answer/answer.dart';
import 'package:calculate/domains/quiz/quiz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_state.freezed.dart';

@freezed
class GameState with _$GameState {
  const factory GameState({
    @Default([]) List<Quiz> figuresList,
    @Default(0) int index,
    @Default([]) List<int> answer,
    @Default([]) List<bool> correctList,
    @Default([]) List<Answer> answerList,
    @Default(180) int leftTime,
    @Default(false) bool isFinished,
  }) = _GameState;
}
