extension DateTimeTransformations on DateTime {
  DateTime get startOfDay {
    return copyWith(
      hour: 0,
      minute: 0,
      second: 0,
      millisecond: 0,
      microsecond: 0,
    );
  }

  DateTime get endOfDay {
    return copyWith(
      hour: 23,
      minute: 59,
      second: 59,
      millisecond: 999,
      microsecond: 999,
    );
  }

  DateTime get startOfWeek {
    final justDate = startOfDay;
    return justDate.subtract(Duration(days: justDate.weekday - 1));
  }

  DateTime get endOfWeek {
    final justDate = endOfDay;
    return justDate.add(Duration(days: 7 - justDate.weekday));
  }

  DateTime get weekAgo {
    return subtract(const Duration(days: 7));
  }

  DateTime get startOfMonth {
    return startOfDay.copyWith(day: 1);
  }

  DateTime get endOfMonth {
    final justDate = endOfDay;
    return justDate.copyWith(month: justDate.month + 1, day: 0);
  }
}
