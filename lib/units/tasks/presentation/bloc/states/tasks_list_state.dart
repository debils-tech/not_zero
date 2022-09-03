import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:not_zero/units/tasks/domain/models/task.dart';

part 'tasks_list_state.freezed.dart';

@freezed
class TasksListState with _$TasksListState {
  const factory TasksListState.loading() = TasksLoadingState;
  const factory TasksListState.loaded(List<Task> tasks) = TasksLoadedState;
}
