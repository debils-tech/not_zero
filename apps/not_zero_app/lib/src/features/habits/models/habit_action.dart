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
import 'package:nz_actions_bus/nz_actions_bus.dart';
import 'package:nz_base_models/nz_base_models.dart';

part 'habit_action.freezed.dart';

@freezed
sealed class HabitAction extends AppAction with _$HabitAction {
  const factory HabitAction.created({required Habit habit}) =
      HabitActionCreated;

  const factory HabitAction.updated({
    required Habit oldHabit,
    required Habit newHabit,
  }) = HabitActionUpdated;

  const factory HabitAction.deleted({required Iterable<Habit> habits}) =
      HabitActionDeletedMultiple;

  const factory HabitAction.completed({
    required Habit habit,
    required HabitCompletion completion,
  }) = HabitActionCompleted;

  const factory HabitAction.notCompleted({
    required Habit habit,
    required HabitCompletion completion,
  }) = HabitActionNotCompleted;

  const HabitAction._();
}
