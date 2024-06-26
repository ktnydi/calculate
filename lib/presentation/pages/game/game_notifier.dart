import 'dart:async';

import 'package:calculate/enums/quiz_type.dart';
import 'package:calculate/model/domains/answer/answer.dart';
import 'package:calculate/model/use_cases/quiz_time.dart';
import 'package:calculate/presentation/pages/game/game_state.dart';
import 'package:calculate/model/domains/quiz/quiz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final gameProvider =
    StateNotifierProvider.family.autoDispose<GameNotifier, GameState, QuizType>(
  (ref, quizType) => GameNotifier(ref, quizType),
);

class GameNotifier extends StateNotifier<GameState> {
  GameNotifier(this._ref, this.quizType) : super(const GameState()) {
    beginCountDown();
  }

  final Ref _ref;
  final QuizType quizType;
  Timer? timer;

  void beginCountDown() {
    final leftTime = _ref.read(quizTimeNotifierProvider) * 1000;

    /// 0.01秒単位で計測
    timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      state = state.copyWith(
        time: state.time + 10,
      );

      if (quizType == QuizType.timeLimit && state.time + 10 == leftTime) {
        finishQuiz();
      }
    });
  }

  void endCountDown() {
    timer?.cancel();
  }

  void fillInAnswer(int figure) {
    if (state.answer.length >= 5) return;

    if (state.answer == '0') {
      return;
    }

    state = state.copyWith(answer: '${state.answer}$figure');
  }

  void clearAnswer() {
    state = state.copyWith(answer: '');
  }

  void backSpace() {
    state = state.copyWith(
      answer: state.answer.substring(0, state.answer.length - 1),
    );
  }

  void checkAnswer(Quiz quiz) {
    final userAnswer = state.answer;

    final time = () {
      if (state.answerList.isEmpty) {
        return Duration(milliseconds: state.time);
      }

      final times = state.answerList.map((e) => e.time.inMilliseconds);
      final sumTimes = times.reduce((value, element) => value + element);
      return Duration(milliseconds: state.time - sumTimes);
    }();

    final answer = Answer(
      quiz: quiz,
      answer: userAnswer,
      time: time,
    );
    state = state.copyWith(
      answerList: [...state.answerList, answer],
    );
  }

  void nextQuiz() {
    state = state.copyWith(index: state.index + 1);
  }

  void finishQuiz() {
    endCountDown();
    state = state.copyWith(isFinished: true);
  }

  void retiredQuiz() {
    endCountDown();
    state = state.copyWith(isFinished: true, isRetired: true);
  }

  @override
  void dispose() {
    endCountDown();
    super.dispose();
  }
}
