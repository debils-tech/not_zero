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

class DateConverter extends TypeConverter<DateTime, String> {
  const DateConverter();

  @override
  DateTime fromSql(String fromDb) {
    final parts = fromDb.split('-');
    assert(parts.length == 3, 'Should be 3 parts: year, month, day');

    final year = int.tryParse(parts.elementAtOrNull(0) ?? '');
    final month = int.tryParse(parts.elementAtOrNull(1) ?? '');
    final day = int.tryParse(parts.elementAtOrNull(2) ?? '');

    if (year == null || month == null || day == null) {
      throw FormatException('Invalid date format', fromDb);
    }

    assert(year > 0, 'Year should be greater than 1');
    assert(month > 0 && month <= 12, 'Month should be between 1 and 12');
    assert(day > 0 && day <= 31, 'Day should be between 1 and 31');

    return DateTime(year, month, day);
  }

  @override
  String toSql(DateTime value) =>
      '${value.year}-${_padLeft(value.month)}-${_padLeft(value.day)}';

  String _padLeft(int number) {
    return number.toString().padLeft(2, '0');
  }
}
