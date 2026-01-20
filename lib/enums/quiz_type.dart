enum QuizType {
  /// 問題数
  numQuizzes(
    selections: [10, 20, 30, 40],
  ),
  ;

  const QuizType({required this.selections});

  final List<int> selections;
}

extension QuizTypeEx on QuizType {
  int get id {
    switch (this) {
      case QuizType.numQuizzes:
        return 1;
    }
  }
}
