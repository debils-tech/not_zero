import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero_app/src/features/tasks/di.dart';
import 'package:nz_base_models/nz_base_models.dart';

class TasksMainListNotifier extends AsyncNotifier<List<Task>> {
  @override
  Future<List<Task>> build() {
    final filters = ref.watch(tasksFiltersNotifier);
    return ref.watch(tasksRepositoryProvider).getTasks(filters);
  }

  Future<void> addTask(Task task) {
    state = AsyncData([task, ...state.value ?? []]);
    return ref.watch(tasksRepositoryProvider).addTask(task);
  }

  Future<void> updateTask(Task task) {
    final oldTask = state.value?.firstWhereOrNull((task) => task.id == task.id);

    if (oldTask != null) {
      state = AsyncData([
        ...state.value?.map((e) => e.id == task.id ? task : e) ?? [task],
      ]);
    }

    return ref
        .watch(tasksRepositoryProvider)
        .updateTask(task, oldTask: oldTask);
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

  Future<void> cancelMultipleTasks(
    Set<String> tasks, {
    required bool showCanceled,
  }) {
    final (newList, takenList) = _takeWhere(
      // TODO(uSlashVlad): Can't cancel completed tasks, skipping them for now
      (e) => tasks.contains(e.id) && !e.isCanceled && !e.isCompleted,
    );
    final editedList = takenList.map((e) => e.cancel(canceled: true));
    if (showCanceled) {
      state = AsyncData([...newList, ...editedList]);
    } else {
      state = AsyncData(newList);
    }
    return ref.watch(tasksRepositoryProvider).cancelMultipleTasks(editedList);
  }

  (List<Task> newList, List<Task> takenList) _takeWhere(
    bool Function(Task e) filter,
  ) {
    return (
      state.value?.where((e) => !filter(e)).toList() ?? [],
      state.value?.where(filter).toList() ?? [],
    );
  }
}
