import 'package:calculate/enums/quiz_category.dart';

enum QuizCategoryMode {
  multiplication([QuizCategory.multiplication]),
  division([QuizCategory.division]),
  additional([QuizCategory.additional]),
  subtraction([QuizCategory.subtraction]),
  random(QuizCategory.values);

  const QuizCategoryMode(this.categories);

  final List<QuizCategory> categories;
}

extension QuizCategoryModeEx on QuizCategoryMode {
  int get id {
    switch (this) {
      case QuizCategoryMode.random:
        return 0;
      case QuizCategoryMode.additional:
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
