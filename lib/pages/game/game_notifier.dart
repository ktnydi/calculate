import 'dart:async';

import 'package:calculate/pages/game/game_state.dart';
import 'package:calculate/providers.dart';
import 'package:calculate/quiz/quiz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final gameProvider = StateNotifierProvider.autoDispose<GameNotifier, GameState>(
  (_) => GameNotifier(),
);

class GameNotifier extends StateNotifier<GameState> {
  GameNotifier() : super(GameState()) {
    beginCountDown();
  }

  Timer? timer;

  void beginCountDown() {
    int leftTime = 180;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      leftTime -= 1;
      if (leftTime == 0) {
        timer.cancel();
      }

      state = state.copyWith(
        leftTime: state.leftTime - 1,
      );
    });
  }

  void endCountDown() {
    timer?.cancel();
  }

  void fillInAnswer(int num) {
    if (state.answer.length >= 10) return;

    state = state.copyWith(
      answer: [...state.answer, num],
    );
  }

  void clearAnswer() {
    state = state.copyWith(
      answer: [],
    );
  }

  void checkAnswer(Quiz quiz) {
    final inComing = state.answer.join();

    switch (quiz.type) {
      case 1:
        final answer = quiz.figures.first + quiz.figures.last;
        state = state.copyWith(
          correctList: [...state.correctList, inComing == '$answer'],
        );
        break;
      case 2:
        final answer = quiz.figures.first - quiz.figures.last;
        state = state.copyWith(
          correctList: [...state.correctList, inComing == '$answer'],
        );
        break;
      case 3:
        final answer = quiz.figures.first * quiz.figures.last;
        state = state.copyWith(
          correctList: [...state.correctList, inComing == '$answer'],
        );
        break;
      case 4:
        final answer = quiz.figures.first ~/ quiz.figures.last;
        state = state.copyWith(
          correctList: [...state.correctList, inComing == '$answer'],
        );
        break;
    }
  }

  void nextQuiz() {
    state = state.copyWith(index: state.index + 1);
  }

  void finishQuiz() {
    state = state.copyWith(leftTime: 0);
  }

  @override
  void dispose() {
    endCountDown();
    super.dispose();
  }
}
