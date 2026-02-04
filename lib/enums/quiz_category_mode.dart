import 'package:flutter/cupertino.dart';

enum QuizCategoryMode {
  multiplication(CupertinoIcons.multiply),
  division(CupertinoIcons.divide),
  add(CupertinoIcons.add),
  subtraction(CupertinoIcons.minus),
  random();

  const QuizCategoryMode([this.icon]);

  final IconData? icon;
}

extension QuizCategoryModeEx on QuizCategoryMode {
  int get id {
    switch (this) {
      case QuizCategoryMode.random:
        return 0;
      case QuizCategoryMode.add:
        return 1;
      case QuizCategoryMode.subtraction:
        return 2;
      case QuizCategoryMode.division:
        return 3;
      case QuizCategoryMode.multiplication:
        return 4;
    }
  }
}
