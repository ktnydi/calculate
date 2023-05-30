enum QuizCategory {
  /// 足し算
  additional('足し算'),

  /// 引き算
  subtraction('引き算'),

  /// 割り算
  division('割り算'),

  /// 掛け算
  multiplication('掛け算'),
  ;

  const QuizCategory(this.label);

  final String label;
}
