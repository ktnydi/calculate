import 'dart:collection';
import 'dart:math';

import 'package:calculate/model/domains/quiz/quiz.dart';
import 'package:calculate/enums/quiz_category.dart';
import 'package:calculate/model/domains/quiz_settings/digit_config.dart';
import 'package:calculate/model/use_cases/quiz_settings_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final quizRepositoryProvider = Provider<QuizRepository>((ref) {
  final quizSettings = ref.watch(quizSettingsManagerNotifierProvider);
  return QuizRepository(quizSettings.digitConfig);
});

class QuizRepository {
  final DigitConfig digitConfig;

  QuizRepository(this.digitConfig);

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

  Quiz getAddition() {
    final firstTerm = getTerm(digit: digitConfig.addition.first);
    final lastTerm = getTerm(digit: digitConfig.addition.second);
    final figures = [firstTerm, lastTerm];
    return Quiz(figures: figures, type: QuizCategory.addition);
  }

  Quiz getSubtraction() {
    final firstTerm = getTerm(digit: digitConfig.subtraction.first);
    final lastTerm = getTerm(digit: digitConfig.subtraction.second);
    final figures = [firstTerm, lastTerm]..sort((a, b) => b.compareTo(a));
    return Quiz(figures: figures, type: QuizCategory.subtraction);
  }

  Quiz getDivision() {
    final divisionJson = digitConfig.division.toJson();

    // 桁数が小さい順に並べる。
    final division = SplayTreeMap<String, dynamic>.from(
      divisionJson,
      (a, b) => divisionJson[a].compareTo(divisionJson[b]),
    );

    /// 割られる数
    late int dividend;

    /// [divided]の1と自身以外のすべての約数
    final divisors = <int>[];
    final minDivisor = pow(10, division.values.first - 1) as int;
    final maxDivisor = pow(10, division.values.first) - 1 as int;

    while (divisors.isEmpty) {
      dividend = getTerm(digit: division.values.last);
      for (int i = minDivisor; i <= min(maxDivisor, dividend ~/ 2); i++) {
        if (i == 1) continue;

        final isDivisor = dividend % i == 0;
        if (isDivisor) divisors.add(i);
      }
    }

    final divisor = divisors[Random().nextInt(divisors.length)];

    final figures = [dividend, divisor];
    return Quiz(figures: figures, type: QuizCategory.division);
  }

  Quiz getMultiplication() {
    final firstTerm = getTerm(digit: digitConfig.multiplication.first);
    final lastTerm = getTerm(digit: digitConfig.multiplication.second);

    final figures = [firstTerm, lastTerm];
    return Quiz(figures: figures, type: QuizCategory.multiplication);
  }
}
