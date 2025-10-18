import 'package:drift/drift.dart';

extension DateTimeInPeriodExt on DateTimeColumn {
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
