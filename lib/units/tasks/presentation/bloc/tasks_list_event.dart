part of 'tasks_list_bloc.dart';

@freezed
class TasksListEvent with _$TasksListEvent {
  const factory TasksListEvent.loadTasks() = _LoadTasksEvent;

  const factory TasksListEvent.changeTaskCompletion(
    Task task, {
    required bool completion,
  }) = _ChangeTaskCompletionEvent;

  const factory TasksListEvent.deleteSelected(Set<String> tasks) =
      _DeleteSelectedTasksEvent;
}
