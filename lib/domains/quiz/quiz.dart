import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz.freezed.dart';
part 'quiz.g.dart';

@freezed
class Quiz with _$Quiz {
  const Quiz._();
  const factory Quiz({
    required List<int> figures,
    required int type,
  }) = _Quiz;

  factory Quiz.fromJson(Map<String, dynamic> json) => _$QuizFromJson(json);

  String get title {
    switch (this.type) {
      case 1:
        return '${this.figures.first} + ${this.figures.last}';
      case 2:
        return '${this.figures.first} - ${this.figures.last}';
      case 3:
        return '${this.figures.first} × ${this.figures.last}';
      case 4:
        return '${this.figures.first} ÷ ${this.figures.last}';
    }
    return '';
  }
}
