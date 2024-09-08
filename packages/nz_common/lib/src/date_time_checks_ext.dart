extension DateTimeChecksExt on DateTime {
  bool isAtSameDay(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  bool isAtSameMonth(DateTime other) {
    return year == other.year && month == other.month;
  }

  bool isAtSameYear(DateTime other) {
    return year == other.year;
  }
}
