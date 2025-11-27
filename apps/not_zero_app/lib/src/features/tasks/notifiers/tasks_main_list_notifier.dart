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

import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero_app/src/features/tasks/di.dart';
import 'package:nz_base_models/nz_base_models.dart';
import 'package:nz_common/nz_common.dart';

class TasksMainListNotifier extends AsyncNotifier<List<Task>> {
  @override
  Future<List<Task>> build() async {
    final filters = ref.watch(tasksFiltersNotifier);
    return ref.watch(tasksRepositoryProvider).getTasks(filters);
  }

  Future<void> addTask(Task task) {
    state = AsyncData([task, ...state.value ?? []]);
    return ref.watch(tasksRepositoryProvider).addTask(task);
  }

  Future<void> updateTask(Task task) {
    final oldTask = state.value?.firstWhereOrNull(
      (oldTask) => oldTask.id == task.id,
    );
    if (oldTask == null) {
      // Can't update a task that isn't in the list
      return Future.value();
    }

    state = AsyncData([
      ...state.value?.map((e) => e.id == task.id ? task : e) ?? [task],
    ]);

    return ref
        .watch(tasksRepositoryProvider)
        .updateTask(oldTask: oldTask, newTask: task);
  }

  Future<void> deleteTasks(Set<String> tasks) {
    final (newList, takenList) =
        state.value?.takeWhere((e) => tasks.contains(e.id)) ??
        (const <Task>[], const <Task>[]);
    state = AsyncData(newList);
    return ref.watch(tasksRepositoryProvider).deleteTasks(takenList);
  }
}
