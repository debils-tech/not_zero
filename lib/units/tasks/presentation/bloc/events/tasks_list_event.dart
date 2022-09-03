import 'package:freezed_annotation/freezed_annotation.dart';

part 'tasks_list_event.freezed.dart';

@freezed
class TasksListEvent with _$TasksListEvent {
  const factory TasksListEvent.loadTasks() = LoadTasksEvent;
}
