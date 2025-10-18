import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero_app/src/features/tasks/di.dart';
import 'package:not_zero_app/src/features/tasks/models/task_action.dart';
import 'package:not_zero_app/src/helpers/ref_actions_extension.dart';
import 'package:nz_base_models/nz_base_models.dart';

class TasksMainListNotifier extends AsyncNotifier<List<Task>> {
  @override
  Future<List<Task>> build() async {
    ref.listenActions<TaskAction>(_handleTaskAction);

    final filters = ref.watch(tasksFiltersNotifier);
    return ref.watch(tasksRepositoryProvider).getTasks(filters);
  }

  void _handleTaskAction(TaskAction action) {
    final tasks = state.value;
    if (tasks == null) return;

    switch (action) {
      case TaskActionCreated(:final task):
        // Add the new task to the beginning of the list
        state = AsyncValue.data([task, ...tasks]);

      case TaskActionUpdated(:final newTask):
        // Update the task in the list
        final index = tasks.indexWhere((t) => t.id == newTask.id);
        if (index == -1) return;

        final newTasks = List<Task>.from(tasks);
        newTasks[index] = newTask;
        state = AsyncValue.data(newTasks);

      case TaskActionDeletedMultiple(:final tasks):
        // Remove deleted tasks from the list
        final deletedIds = tasks.map((t) => t.id).toSet();
        final filteredTasks =
            state.value?.where((t) => !deletedIds.contains(t.id)).toList() ??
            [];
        state = AsyncValue.data(filteredTasks);
    }
  }

  Future<void> addTask(Task task) {
    state = AsyncData([task, ...state.value ?? []]);
    return ref.watch(tasksRepositoryProvider).addTask(task);
  }

  Future<void> updateTask(Task task) {
    final oldTask = state.value?.firstWhereOrNull((task) => task.id == task.id);
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

  Future<void> cancelMultipleTasks(
    Set<String> tasks, {
    required bool showCanceled,
  }) {
    final (newList, takenList) = _takeWhere(
      // TODO(uSlashVlad): Can't cancel completed tasks, skipping them for now
      (e) => tasks.contains(e.id) && !e.isCanceled && !e.isCompleted,
    );
    if (takenList.isEmpty) {
      // TODO(uSlashVlad): Add a notification about this
      return Future.value();
    }

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
