import 'dart:async';

import 'package:calculate/pages/game/game_state.dart';
import 'package:calculate/providers.dart';
import 'package:calculate/quiz/quiz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final gameProvider = StateNotifierProvider.autoDispose<GameNotifier, GameState>(
  (ref) => GameNotifier(ref.read),
);

class GameNotifier extends StateNotifier<GameState> {
  GameNotifier(this._read) : super(GameState()) {
    final prefs = _read(sharedPreferencesProvider);
    final leftTime = prefs.getInt('limit') ?? 180;
    state = state.copyWith(
      leftTime: leftTime,
    );
    beginCountDown();
  }

  final Reader _read;
  Timer? timer;

  void beginCountDown() {
    final prefs = _read(sharedPreferencesProvider);
    int leftTime = prefs.getInt('limit') ?? 180;
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

  void fillInAnswer(int num) {
    if (state.answer.length >= 10) return;

    final isOnlyZero =
        num == 0 && state.answer.contains(0) && state.answer.length == 1;
    if (isOnlyZero) return;

    final includeZero = state.answer.contains(0) && state.answer.length == 1;

    state = state.copyWith(
      answer: [if (!includeZero) ...state.answer, num],
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
