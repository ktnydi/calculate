import 'package:calculate/enums/quiz_type.dart';

enum Preferences {
  quizType,
  numQuizzes,
  timeLimit,
  keyboardLocation,
}

extension PreferencesEx on Preferences {
  String get key {
    switch (this) {
      case Preferences.quizType:
        return 'quizType';
      case Preferences.numQuizzes:
        return 'quizLength';
      case Preferences.timeLimit:
        return 'limit';
      case Preferences.keyboardLocation:
        return 'keyboardLocation';
    }
  }

  dynamic get defaultValue {
    switch (this) {
      case Preferences.quizType:
        return QuizType.numQuizzes;
      case Preferences.numQuizzes:
        return 10;
      case Preferences.timeLimit:
        return 60;
      case Preferences.keyboardLocation:
        return 0;
    }
  }
}
