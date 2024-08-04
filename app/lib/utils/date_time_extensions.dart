extension DateTimeExtensions on DateTime {
  bool isSameDay(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  DateTime get dayBefore => subtract(const Duration(days: 1));

  DateTime get dayAfter => add(const Duration(days: 1));
}
