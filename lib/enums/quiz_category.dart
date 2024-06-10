import 'package:flutter/cupertino.dart';

enum QuizCategory {
  /// 足し算
  additional('足し算', CupertinoIcons.add),

  /// 引き算
  subtraction('引き算', CupertinoIcons.minus),

  /// 割り算
  division('割り算', CupertinoIcons.divide),

  /// 掛け算
  multiplication('掛け算', CupertinoIcons.multiply),
  ;

  const QuizCategory(this.label, this.icon);

  final String label;

  final IconData icon;
}
