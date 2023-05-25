import 'package:intl/intl.dart';

extension numExtension on num {
  String digit() {
    final format = NumberFormat('0.00');
    return format.format(this);
  }
}
