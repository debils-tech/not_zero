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
import 'package:nz_base_models/src/reminder_local_time.dart';
import 'package:nz_base_models/src/tag.dart';
import 'package:nz_base_models/src/task_importance.dart';
import 'package:uuid/uuid.dart';

part 'habit.freezed.dart';

@freezed
abstract class Habit with _$Habit {
  const factory Habit({
    required String id,
    required String title,
    required DateTime createdAt,
    @Default('') String description,
    @Default(TaskImportance.normal) TaskImportance importance,
    DateTime? modifiedAt,
    @JsonKey(toJson: ItemTag.tagsToIds) @Default([]) List<ItemTag> tags,
    ReminderLocalTime? reminderTime,
  }) = _Habit;

  const Habit._();

  factory Habit.create({
    required String title,
    String? description,
    TaskImportance? importance,
    ReminderLocalTime? reminderTime,
  }) => Habit(
    id: const Uuid().v4(),
    title: title,
    description: description ?? '',
    createdAt: DateTime.now(),
    importance: importance ?? .normal,
    reminderTime: reminderTime,
  );

  Habit edit({
    required String title,
    required String? description,
    required TaskImportance importance,
    required ReminderLocalTime? reminderTime,
  }) => copyWith(
    title: title,
    description: description ?? '',
    importance: importance,
    reminderTime: reminderTime,
    modifiedAt: DateTime.now(),
  );
}
