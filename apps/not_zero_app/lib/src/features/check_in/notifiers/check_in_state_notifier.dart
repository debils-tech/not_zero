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

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero_app/src/features/check_in/di.dart';
import 'package:not_zero_app/src/features/check_in/models/check_in_streak_state.dart';

class CheckInStateNotifier extends AsyncNotifier<CheckInStreakState> {
  @override
  Future<CheckInStreakState> build() {
    return ref.watch(checkInRepositoryProvider).getCurrentStreakState();
  }

  Future<void> checkIn() async {
    final newCheckIn = await ref.watch(checkInRepositoryProvider).checkIn();
    state = AsyncValue.data(CheckInStreakState.checkedIn(checkIn: newCheckIn));
  }
}
