import 'dart:async';

import 'package:calculate/domains/answer/answer.dart';
import 'package:calculate/enums/preference.dart';
import 'package:calculate/enums/quiz_type.dart';
import 'package:calculate/pages/game/game_state.dart';
import 'package:calculate/providers.dart';
import 'package:calculate/domains/quiz/quiz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final gameProvider = StateNotifierProvider.autoDispose<GameNotifier, GameState>(
  (ref) => GameNotifier(ref),
);

class GameNotifier extends StateNotifier<GameState> {
  GameNotifier(this._ref) : super(GameState()) {
    final prefs = _ref.read(sharedPreferencesProvider);

    /// 問題形式を取得
    final quizType = QuizType.values.firstWhere(
      (value) => value.id == prefs.getInt(Preferences.quizType.key),
      orElse: () => Preferences.quizType.defaultValue,
    );
    if (quizType == QuizType.numQuizzes) return;

    /// 問題形式が時間制限ならカウントを始める。
    final leftTime = prefs.getInt(Preferences.timeLimit.key) ??
        Preferences.timeLimit.defaultValue;
    state = state.copyWith(
      leftTime: leftTime,
    );
    beginCountDown();
  }

  final Ref _ref;
  Timer? timer;

  void beginCountDown() {
    final prefs = _ref.read(sharedPreferencesProvider);
    int leftTime = prefs.getInt(Preferences.timeLimit.key) ??
        Preferences.timeLimit.defaultValue;
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

    final isOnlyZero =
        figure == 0 && state.answer.contains(0) && state.answer.length == 1;
    if (isOnlyZero) return;

    final includeZero = state.answer.contains(0) && state.answer.length == 1;

    state = state.copyWith(
      answer: [if (!includeZero) ...state.answer, figure],
    );
  }

  void clearAnswer() {
    state = state.copyWith(
      answer: [],
    );
  }

  void checkAnswer(Quiz quiz) {
    final userAnswer = state.answer.join();
    final correctAnswer = quiz.correctAnswer;
    final isCorrect = userAnswer == '$correctAnswer';
    final answer = Answer(
      quiz: quiz,
      answer: userAnswer,
      isCorrect: isCorrect,
    );
    state = state.copyWith(
      correctList: [...state.correctList, isCorrect],
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
