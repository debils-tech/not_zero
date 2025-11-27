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
import 'package:uuid/uuid.dart';

part 'habit_completion.freezed.dart';
part 'habit_completion.g.dart';

@freezed
abstract class HabitCompletion with _$HabitCompletion {
  const factory HabitCompletion({
    required String id,
    required String habitId,
    required HabitCompletionType type,
    required DateTime completedDate,
  }) = _HabitCompletion;

  factory HabitCompletion.create({
    required String habitId,
    required DateTime completedDate,
    HabitCompletionType type = HabitCompletionType.completed,
  }) => HabitCompletion(
    id: const Uuid().v4(),
    habitId: habitId,
    type: type,
    completedDate: completedDate,
  );

  factory HabitCompletion.fromJson(Map<String, dynamic> json) =>
      _$HabitCompletionFromJson(json);
}

enum HabitCompletionType { completed, skipped }
