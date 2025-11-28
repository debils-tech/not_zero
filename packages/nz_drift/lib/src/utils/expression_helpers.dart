// Not Zero, cross-platform wellbeing application.
// Copyright (C) 2025 Nagorny Vladislav
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

import 'package:drift/drift.dart';

extension DateTimeExpressionHelper on Expression<DateTime> {
  Expression<bool> sameDayAs(DateTime date) =>
      this.date.equalsExp(_dateStr(date));

  Expression<bool> inPeriod(DateTime? startPeriod, DateTime? endPeriod) {
    if (startPeriod != null && endPeriod != null) {
      // in range [start, end]
      return this.isNotNull() &
          isSmallerOrEqualValue(endPeriod) &
          isBiggerOrEqualValue(startPeriod);
    }

    if (startPeriod != null) {
      // in range [start, +inf)
      return this.isNotNull() & isBiggerOrEqualValue(startPeriod);
    }

    if (endPeriod != null) {
      // in range (-inf, end]
      return this.isNotNull() & isSmallerOrEqualValue(endPeriod);
    }

    // in range (-inf, +inf)
    return this.isNotNull();
  }
}

extension TextDateExpressionHelper on Expression<String> {
  Expression<bool> sameDayAs(DateTime date) => equalsExp(_dateStr(date));

  Expression<bool> dayBefore(DateTime date) => isSmallerThan(_dateStr(date));

  Expression<bool> dayAfter(DateTime date) => isBiggerThan(_dateStr(date));

  Expression<bool> dayInRange(DateTime? startDate, DateTime? endDate) {
    if (startDate != null && endDate != null) {
      // in range [start, end]
      return this.isNotNull() &
          isSmallerOrEqual(_dateStr(endDate)) &
          isBiggerOrEqual(_dateStr(startDate));
    }

    if (startDate != null) {
      // in range [start, +inf)
      return this.isNotNull() & isBiggerOrEqual(_dateStr(startDate));
    }

    if (endDate != null) {
      // in range (-inf, end]
      return this.isNotNull() & isSmallerOrEqual(_dateStr(endDate));
    }

    // in range (-inf, +inf)
    return this.isNotNull();
  }
}

Expression<String> _dateStr(DateTime date) => Variable(date).date;
