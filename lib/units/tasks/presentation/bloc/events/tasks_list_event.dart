import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:not_zero/units/tasks/domain/models/task.dart';

part 'tasks_list_event.freezed.dart';

@freezed
class TasksListEvent with _$TasksListEvent {
  const factory TasksListEvent.loadTasks() = LoadTasksEvent;

  const factory TasksListEvent.changeTaskCompletion(
    Task task, {
    required bool completion,
  }) = ChangeTaskCompletionEvent;
}
