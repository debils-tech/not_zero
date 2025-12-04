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

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nz_base_models/nz_base_models.dart';

part 'habits_counting_data.freezed.dart';

@freezed
abstract class HabitsCountingData with _$HabitsCountingData {
  const factory HabitsCountingData({
    required Map<UniqueHabitCombination, int> completed,
    required int created,
  }) = _HabitsCountingData;
}

typedef UniqueHabitCombination = ({
  TaskImportance importance,
  HabitStreakPeriod streakPeriod,
});

enum HabitStreakPeriod {
  fewDays(1, 14),
  fewWeeks(14, 28),
  fewMonths(28, null)
  ;

  const HabitStreakPeriod(
    this.minDays,
    this.maxDays,
  );

  final int minDays;
  final int? maxDays;
}
