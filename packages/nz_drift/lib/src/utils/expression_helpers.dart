import 'package:drift/drift.dart';

extension DateTimeExpressionHelper on Expression<DateTime> {
  Expression<bool> sameDayAs(DateTime date) =>
      this.date.equalsExp(_dateStr(date));
}

extension TextDateExpressionHelper on Expression<String> {
  Expression<bool> sameDayAs(DateTime date) => equalsExp(_dateStr(date));

  Expression<bool> dayBefore(DateTime date) => isSmallerThan(_dateStr(date));

  Expression<bool> dayAfter(DateTime date) => isBiggerThan(_dateStr(date));
}

Expression<String> _dateStr(DateTime date) => Variable(date).date;
