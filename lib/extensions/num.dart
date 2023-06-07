import 'package:intl/intl.dart';

extension NumExtension on num {
  String digit() {
    final format = NumberFormat('0.00');
    return format.format(this);
  }
}
