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

extension DateTimeTransformationsExt on DateTime {
  // Days transformations

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

  DateTime get dayBefore {
    return subtract(const Duration(days: 1));
  }

  DateTime get dayAfter {
    return add(const Duration(days: 1));
  }

  // Weeks transformations

  DateTime get startOfWeek {
    final justDate = startOfDay;
    return justDate.subtract(Duration(days: justDate.weekday - 1));
  }

  DateTime get endOfWeek {
    final justDate = endOfDay;
    return justDate.add(Duration(days: 7 - justDate.weekday));
  }

  DateTime get weekBefore {
    return subtract(const Duration(days: 7));
  }

  DateTime get weekAfter {
    return add(const Duration(days: 7));
  }

  // Month transformations

  DateTime get startOfMonth {
    return startOfDay.copyWith(day: 1);
  }

  DateTime get endOfMonth {
    final justDate = endOfDay;
    return justDate.copyWith(month: justDate.month + 1, day: 0);
  }

  // Other

  DateTime get withSecondsAccuracy {
    return copyWith(millisecond: 0, microsecond: 0);
  }
}
