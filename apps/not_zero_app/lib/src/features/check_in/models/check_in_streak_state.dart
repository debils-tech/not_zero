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

part 'check_in_streak_state.freezed.dart';

@freezed
sealed class CheckInStreakState with _$CheckInStreakState {
  const factory CheckInStreakState.checkedIn({
    required AppDailyCheckIn checkIn,
  }) = CheckInStreakStateCheckedIn;

  const factory CheckInStreakState.streakContinued({
    required AppDailyCheckIn lastCheckIn,
  }) = CheckInStreakStateContinued;

  const factory CheckInStreakState.streakLost({
    required AppDailyCheckIn lastCheckIn,
  }) = CheckInStreakStateLost;

  const factory CheckInStreakState.noCheckIn() = CheckInStreakStateNoCheckIn;
}
