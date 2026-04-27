// Not Zero, cross-platform wellbeing application.
// Copyright (C) 2026 Nagorny Vladislav
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

enum WeekStart {
  monday,
  sunday,
  saturday
  ;

  int get weekday => switch (this) {
    WeekStart.monday => DateTime.monday,
    WeekStart.sunday => DateTime.sunday,
    WeekStart.saturday => DateTime.saturday,
  };

  int get firstDayOfWeekIndex => weekday % DateTime.daysPerWeek;

  static WeekStart? fromName(String? value) {
    if (value == null) return null;
    for (final item in WeekStart.values) {
      if (item.name == value) return item;
    }
    return null;
  }

  static WeekStart fromWeekday(int weekday) {
    return switch (weekday) {
      DateTime.monday => WeekStart.monday,
      DateTime.sunday => WeekStart.sunday,
      DateTime.saturday => WeekStart.saturday,
      _ => WeekStart.monday,
    };
  }
}
