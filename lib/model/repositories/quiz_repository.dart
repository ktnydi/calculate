import 'package:calculate/model/domains/quiz/quiz.dart';
import 'package:calculate/enums/quiz_category.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final quizRepositoryProvider = Provider<QuizRepository>(
  (_) => QuizRepository(),
);

class QuizRepository {
  /// [start]から[last]の範囲内でランダムに整数を1つ取得する。
  int _getRandamIntInRange(int start, int last) {
    assert(start < last);
    assert(start > 0);
    assert(last > 0);

    final rangeValue = List.generate(
      last + 1 - start,
      (index) => start + index,
    );
    return [...rangeValue..shuffle()].first;
  }

  Quiz getAdditional() {
    final num1 = _getRandamIntInRange(10, 99);
    final num2 = _getRandamIntInRange(10, 99);
    final figures = [num1, num2];
    return Quiz(figures: figures, type: QuizCategory.additional);
  }

  Quiz getSubtraction() {
    final num1 = _getRandamIntInRange(10, 99);
    final num2 = _getRandamIntInRange(10, 99);
    final figures = num1 > num2 ? [num1, num2] : [num2, num1];
    return Quiz(figures: figures, type: QuizCategory.subtraction);
  }

  Quiz getDivision() {
    final num1 = _getRandamIntInRange(10, 99);

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
    final num1 = _getRandamIntInRange(1, 9);
    final num2 = _getRandamIntInRange(1, 9);

    final figures = [num1, num2];
    return Quiz(figures: figures, type: QuizCategory.multiplication);
  }
}
