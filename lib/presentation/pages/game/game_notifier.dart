import 'dart:async';
import 'dart:math';

import 'package:calculate/enums/quiz_category.dart';
import 'package:calculate/model/domains/answer/answer.dart';
import 'package:calculate/model/domains/score/score.dart';
import 'package:calculate/presentation/pages/game/game_state.dart';
import 'package:calculate/model/domains/quiz/quiz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final gameProvider = StateNotifierProvider.autoDispose<GameNotifier, GameState>(
  (ref) => GameNotifier(),
);

class GameNotifier extends StateNotifier<GameState> {
  GameNotifier() : super(const GameState()) {
    beginCountDown();
  }

  Timer? timer;

  void beginCountDown() {
    /// 0.01秒単位で計測
    timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      state = state.copyWith(
        time: state.time + 10,
      );
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

    final score = calculateScore(quiz, time);

    final answer = Answer(
      quiz: quiz,
      answer: userAnswer,
      time: time,
      score: score,
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

  Score calculateScore(Quiz quiz, Duration time) {
    final firstDigit = quiz.figures.first.toString().length;
    final secondDigit = quiz.figures.last.toString().length;
    final operatorPoint = switch (quiz.type) {
      QuizCategory.addition => 10,
      QuizCategory.subtraction => 15,
      QuizCategory.division => 12,
      QuizCategory.multiplication => 18,
    };

    final targetTime = calculateTargetTime(firstDigit, secondDigit, quiz.type);
    final differenceTime = time - targetTime;

    /// 解答時間によってスコアを変化させる。
    final timeMultiplier = (1.0 - (differenceTime.inMilliseconds / 1000) * 0.05)
        .clamp(0.1, 1.0);

    final rawScore =
        (firstDigit * secondDigit) +
        min<int>(firstDigit, secondDigit) +
        operatorPoint * timeMultiplier;

    final score = Score(
      firstDigit: firstDigit,
      secondDigit: secondDigit,
      rawScore: rawScore.round(),
    );

    return score;
  }

  Duration calculateTargetTime(int digitA, int digitB, QuizCategory op) {
    assert(digitB >= digitA);

    const double baseTime = 1.5;

    // 1. 桁数による重み
    final digitFactor = digitB + (digitA * 0.5);

    // 2. 演算子による重み
    final opFactor = switch (op) {
      QuizCategory.addition => 1.0,
      QuizCategory.subtraction => 1.2,
      QuizCategory.division => () {
        // 余りの出ない割り算では同じ桁数だと簡単になるため、目標時間を厳しくする。
        if (digitA == digitB) {
          return 0.5 + (digitA - 1) * 0.1;
        }

        if (digitB - digitA == 1) {
          return 1.2;
        }

        if (digitB - digitA >= 2) {
          return 2.2;
        }

        return 1.0;
      }(),
      QuizCategory.multiplication => 1.8,
    };

    final targetTime = baseTime * digitFactor * opFactor;

    return Duration(milliseconds: targetTime.round());
  }
}
