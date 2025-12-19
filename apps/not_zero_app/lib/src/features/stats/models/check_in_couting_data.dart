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

part 'check_in_couting_data.freezed.dart';

@freezed
abstract class CheckInCoutingData with _$CheckInCoutingData {
  const factory CheckInCoutingData({
    required Map<CheckInStreakPeriod, int> checkIns,
  }) = _CheckInCoutingData;
}

enum CheckInStreakPeriod {
  fewDays(1, 15),
  fewWeeks(15, 29),
  fewMonths(29, 90),
  longTime(90, null)
  ;

  const CheckInStreakPeriod(
    this.minDays,
    this.maxDays,
  );

  factory CheckInStreakPeriod.fromStreak(int streak) {
    for (final period in values) {
      final maxDays = period.maxDays;
      if (streak >= period.minDays && (maxDays == null || streak < maxDays)) {
        return period;
      }
    }
    return fewDays;
  }

  final int minDays;
  final int? maxDays;
}
