import 'dart:math';

import 'package:calculate/model/domains/quiz/quiz.dart';
import 'package:calculate/enums/quiz_category.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final quizRepositoryProvider = Provider<QuizRepository>(
  (_) => QuizRepository(),
);

class QuizRepository {
  Quiz getAdditional() {
    final random = Random();
    const minNum = 10;
    const maxNum = 100;
    createNum(int min, int max) => min + random.nextInt(max - min);
    final num1 = createNum(minNum, maxNum);
    final num2 = createNum(minNum, maxNum);
    final figures = [num1, num2];
    return Quiz(figures: figures, type: QuizCategory.additional);
  }

  Quiz getSubtraction() {
    final random = Random();
    const minNum = 10;
    const maxNum = 100;
    createNum(int min, int max) => min + random.nextInt(max - min);
    final num1 = createNum(minNum, maxNum);
    final num2 = createNum(minNum, maxNum);
    final figures = [num1, num2]..sort((i, j) => j - i);
    return Quiz(figures: figures, type: QuizCategory.subtraction);
  }

  Quiz getDivision() {
    final random = Random();
    const minNum = 10;
    const maxNum = 100;
    createNum(int min, int max) => min + random.nextInt(max - min);
    final num1 = createNum(minNum, maxNum);

    /// num1の約数をランダムで1つ取得する
    final divisors = <int>[];
    for (int i = 1; i <= num1 ~/ 2; i++) {
      final isDivisor = num1 % i == 0;
      if (isDivisor) divisors.add(i);
    }
    divisors.add(num1);
    divisors.shuffle();
    final num2 = divisors.first;

    final figures = [num1, num2];
    return Quiz(figures: figures, type: QuizCategory.division);
  }

  Quiz getMultiplication() {
    final random = Random();
    const minNum = 0;
    const maxNum = 10;
    createNum(int min, int max) => min + random.nextInt(max - min);
    final num1 = createNum(minNum, maxNum);
    final num2 = createNum(minNum, maxNum);
    final figures = [num1, num2];
    return Quiz(figures: figures, type: QuizCategory.multiplication);
  }
}
