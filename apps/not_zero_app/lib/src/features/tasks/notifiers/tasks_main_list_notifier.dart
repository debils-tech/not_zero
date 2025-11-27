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

  Future<void> deleteTask(Task task) {
    state = AsyncData(
      state.value?.where((e) => e.id != task.id).toList() ?? [],
    );
    return ref.watch(tasksRepositoryProvider).deleteTask(task);
  }

  Future<void> deleteMultipleTasks(Set<String> tasks) {
    final (newList, takenList) = _takeWhere((e) => tasks.contains(e.id));
    state = AsyncData(newList);
    return ref.watch(tasksRepositoryProvider).deleteMultipleTasks(takenList);
  }

  // Future<void> cancelMultipleTasks(
  //   Set<String> tasks, {
  //   required bool showCanceled,
  // }) {
  //   final (newList, takenList) = _takeWhere(
  //     (e) => tasks.contains(e.id) && !e.isCanceled && !e.isCompleted,
  //   );
  //   if (takenList.isEmpty) {
  //     return Future.value();
  //   }

  //   final editedList = takenList.map((e) => e.cancel(canceled: true));
  //   if (showCanceled) {
  //     state = AsyncData([...newList, ...editedList]);
  //   } else {
  //     state = AsyncData(newList);
  //   }
  //   return ref.watch(tasksRepositoryProvider).cancelMultipleTasks(editedList);
  // }

  (List<Task> newList, List<Task> takenList) _takeWhere(
    bool Function(Task e) filter,
  ) {
    return (
      state.value?.where((e) => !filter(e)).toList() ?? [],
      state.value?.where(filter).toList() ?? [],
    );
  }
}
