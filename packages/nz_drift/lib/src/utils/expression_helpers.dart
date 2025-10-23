import 'package:drift/drift.dart';

extension DateTimeExpressionHelper on Expression<DateTime> {
  Expression<bool> sameDayAs(DateTime date) =>
      this.date.equalsExp(_dateStr(date));

  Expression<bool> inPeriod(DateTime? startPeriod, DateTime? endPeriod) {
    if (startPeriod == null && endPeriod != null) {
      // in range (-inf, end]
      return this.isNotNull() & isSmallerOrEqualValue(endPeriod);
    }

    if (startPeriod != null && endPeriod == null) {
      // in range [start, +inf)
      return this.isNotNull() & isBiggerOrEqualValue(startPeriod);
    }

    if (startPeriod != null && endPeriod != null) {
      // in range [start, end]
      return this.isNotNull() &
          isSmallerOrEqualValue(endPeriod) &
          isBiggerOrEqualValue(startPeriod);
    }

    // in range (-inf, +inf)
    return this.isNotNull();
  }
}

extension TextDateExpressionHelper on Expression<String> {
  Expression<bool> sameDayAs(DateTime date) => equalsExp(_dateStr(date));

  Expression<bool> dayBefore(DateTime date) => isSmallerThan(_dateStr(date));

  Expression<bool> dayAfter(DateTime date) => isBiggerThan(_dateStr(date));

  Expression<bool> dayInRange(DateTime startDate, DateTime endDate) =>
      isSmallerOrEqual(_dateStr(endDate)) &
      isBiggerOrEqual(_dateStr(startDate));
}

Expression<String> _dateStr(DateTime date) => Variable(date).date;
