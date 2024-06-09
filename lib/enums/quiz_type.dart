enum QuizType {
  /// 時間制限
  timeLimit(
    selections: [30, 60, 120, 180],
  ),

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
      case QuizType.timeLimit:
        return 0;
      case QuizType.numQuizzes:
        return 1;
    }
  }
}
