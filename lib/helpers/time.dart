import 'package:intl/intl.dart';

extension FormatBasedOnToday on DateTime {
  String localFormat() {
    final dateToCompare = DateTime.now();
    if (day == dateToCompare.day) {
      return DateFormat.Hms().format(this);
    } else if (year == dateToCompare.year) {
      return DateFormat.MMMMd().format(this);
    } else {
      return DateFormat.yMMMd().format(this);
    }
  }
}
