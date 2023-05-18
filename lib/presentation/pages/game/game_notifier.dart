import 'dart:async';

import 'package:calculate/model/domains/answer/answer.dart';
import 'package:calculate/enums/quiz_type.dart';
import 'package:calculate/model/use_cases/quiz_time.dart';
import 'package:calculate/presentation/pages/game/game_state.dart';
import 'package:calculate/model/domains/quiz/quiz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final gameProvider = StateNotifierProvider.autoDispose<GameNotifier, GameState>(
  (ref) => GameNotifier(ref),
);

class GameNotifier extends StateNotifier<GameState> {
  GameNotifier(this._ref) : super(GameState()) {
    /// 問題形式を取得
    final quizType = _ref.read(quizTypeNotifierProvider);
    if (quizType == QuizType.numQuizzes) return;

    /// 問題形式が時間制限ならカウントを始める。
    final leftTime = _ref.read(quizTimeNotifierProvider);
    state = state.copyWith(
      leftTime: leftTime,
    );
    beginCountDown();
  }

  final Ref _ref;
  Timer? timer;

  void beginCountDown() {
    int leftTime = _ref.read(quizTimeNotifierProvider);
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      leftTime -= 1;
      if (leftTime == 0) {
        timer.cancel();
      }

      state = state.copyWith(
        leftTime: leftTime,
      );
    });
  }

  void endCountDown() {
    timer?.cancel();
  }

  void fillInAnswer(int figure) {
    if (state.answer.length >= 10) return;

    if (state.answer == '0') {
      return;
    }

    state = state.copyWith(answer: state.answer + '$figure');
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
    final correctAnswer = quiz.correctAnswer;
    final isCorrect = userAnswer == '$correctAnswer';
    final answer = Answer(
      quiz: quiz,
      answer: userAnswer,
      isCorrect: isCorrect,
    );
    state = state.copyWith(
      answerList: [...state.answerList, answer],
    );
  }

  void nextQuiz() {
    state = state.copyWith(index: state.index + 1);
  }

  void finishQuiz() {
    state = state.copyWith(isFinished: true);
  }

  @override
  void dispose() {
    endCountDown();
    super.dispose();
  }
}
