import 'package:drift/drift.dart';

extension DateTimeExpressionHelper on Expression<DateTime> {
  Expression<bool> sameDayAs(DateTime date) =>
      year.equals(date.year) & month.equals(date.month) & day.equals(date.day);


  Expression<bool> dayBefore(DateTime date) =>
      year.isSmallerThanValue(date.year) |
      month.isSmallerThanValue(date.month) |
      day.isSmallerThanValue(date.day);

  Expression<bool> dayAfter(DateTime date) =>
      year.isBiggerThanValue(date.year) |
      month.isBiggerThanValue(date.month) |
      day.isBiggerThanValue(date.day);
}
