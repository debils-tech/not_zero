import 'package:drift/drift.dart';

extension DateTimeExpressionHelper on Expression<DateTime> {
  Expression<bool> sameDayAs(DateTime date) => this.date.equals(_dateStr(date));

  Expression<bool> dayBefore(DateTime date) =>
      this.date.isSmallerThanValue(_dateStr(date));

  Expression<bool> dayAfter(DateTime date) =>
      this.date.isBiggerThanValue(_dateStr(date));

  String _dateStr(DateTime date) => date.toIso8601String().split('T').first;
}
