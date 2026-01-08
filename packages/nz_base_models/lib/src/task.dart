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
import 'package:nz_common/nz_common.dart';
import 'package:uuid/uuid.dart';

part 'task.freezed.dart';

@freezed
abstract class Task with _$Task, ObjectIdMixin implements Comparable<Task> {
  factory Task({
    required String id,
    required String title,
    required DateTime createdAt,
    @Default('') String description,
    @Default(TaskImportance.normal) TaskImportance importance,
    DateTime? modifiedAt,
    DateTime? completedAt,
    DateTime? canceledAt,
    DateTime? forDate,
    ReminderLocalTime? reminderTime,
    @Default(true) bool persistent,
    @JsonKey(toJson: ItemTag.tagsToIds) @Default([]) List<ItemTag> tags,
  }) = _Task;

  const Task._();

  factory Task.create({
    required String title,
    required TaskImportance importance,
    String? description,
    List<ItemTag>? tags,
    DateTime? forDate,
    bool? persistent,
  }) => Task(
    id: const Uuid().v4(),
    title: title,
    description: description ?? '',
    createdAt: DateTime.now(),
    importance: importance,
    tags: tags ?? [],
    forDate: forDate,
    persistent: persistent ?? true,
  );

  Task edit({
    required String title,
    required String? description,
    required TaskImportance importance,
    required List<ItemTag>? tags,
    required DateTime? forDate,
    required bool? persistent,
  }) => copyWith(
    title: title,
    description: description ?? '',
    createdAt: DateTime.now(),
    importance: importance,
    tags: tags ?? [],
    forDate: forDate,
    persistent: persistent ?? true,
  );

  Task complete({required bool completed}) => copyWith(
    completedAt: completed ? DateTime.now() : null,
    canceledAt: null,
  );

  bool get isCompleted => completedAt != null;

  Task cancel({required bool canceled}) =>
      copyWith(canceledAt: canceled ? DateTime.now() : null, completedAt: null);

  bool get isCanceled => canceledAt != null;

  @override
  int compareTo(Task other) {
    // Sorting by completeness
    if (isCompleted != other.isCompleted) {
      if (isCompleted) {
        // Moving back completed tasks
        return -1;
      }
      // Moving forward not completed tasks
      return 1;
    }

    // Sorting by importance
    if (importance != other.importance) {
      if (importance.index < other.importance.index) {
        // Moving back less important tasks
        return -1;
      }
      // Moving forward more important tasks
      return 1;
    }

    // Sorting by time that task was created
    return createdAt.compareTo(other.createdAt);
  }
}
