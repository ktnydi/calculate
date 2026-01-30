import 'dart:math';

import 'package:calculate/model/domains/quiz/quiz.dart';
import 'package:calculate/enums/quiz_category.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final quizRepositoryProvider = Provider<QuizRepository>(
  (_) => QuizRepository(),
);

class QuizRepository {
  int getTerm({int digit = 2}) {
    assert(digit > 0, '[digit] must be greater than 0.');

    final min = pow(10, digit - 1) as int;
    final max = pow(10, digit) as int;
    int figure = Random().nextInt(max - min) + min;

    // `1`だと問題が簡単すぎるので再取得する。
    while (digit == 1 && figure == 1) {
      figure = Random().nextInt(max - min) + min;
    }

    return figure;
  }

  Quiz getAdditional() {
    final firstTerm = getTerm(digit: 2);
    final lastTerm = getTerm(digit: 2);
    final figures = [firstTerm, lastTerm];
    return Quiz(figures: figures, type: QuizCategory.additional);
  }

  Quiz getSubtraction() {
    final firstTerm = getTerm(digit: 2);
    final lastTerm = getTerm(digit: 2);
    final figures = [firstTerm, lastTerm]..sort((a, b) => b.compareTo(a));
    return Quiz(figures: figures, type: QuizCategory.subtraction);
  }

  Quiz getDivision() {
    /// 割られる数
    late int dividend;

    /// [divided]の1と自身以外のすべての約数
    final divisors = <int>[];

    while (divisors.isEmpty) {
      dividend = getTerm(digit: 2);

      for (int i = 2; i <= dividend ~/ 2; i++) {
        final isDivisor = dividend % i == 0;
        if (isDivisor) divisors.add(i);
      }
    }

    final divisor = divisors[Random().nextInt(divisors.length)];

    final figures = [dividend, divisor];
    return Quiz(figures: figures, type: QuizCategory.division);
  }

  Quiz getMultiplication() {
    final firstTerm = getTerm(digit: 1);
    final lastTerm = getTerm(digit: 1);

    final figures = [firstTerm, lastTerm];
    return Quiz(figures: figures, type: QuizCategory.multiplication);
  }
}
