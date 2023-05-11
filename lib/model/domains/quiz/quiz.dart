import 'package:calculate/enums/quiz_category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz.freezed.dart';
part 'quiz.g.dart';

@freezed
class Quiz with _$Quiz {
  const Quiz._();
  const factory Quiz({
    required List<int> figures,
    required QuizCategory type,
  }) = _Quiz;

  factory Quiz.fromJson(Map<String, dynamic> json) => _$QuizFromJson(json);

  String get title {
    switch (this.type) {
      case QuizCategory.additional:
        return '${this.figures.first} + ${this.figures.last}';
      case QuizCategory.subtraction:
        return '${this.figures.first} - ${this.figures.last}';
      case QuizCategory.multiplication:
        return '${this.figures.first} × ${this.figures.last}';
      case QuizCategory.division:
        return '${this.figures.first} ÷ ${this.figures.last}';
    }
  }

  int get correctAnswer {
    switch (type) {
      case QuizCategory.additional:
        return figures.first + figures.last;
      case QuizCategory.subtraction:
        return figures.first - figures.last;
      case QuizCategory.division:
        return figures.first ~/ figures.last;
      case QuizCategory.multiplication:
        return figures.first * figures.last;
    }
  }
}
