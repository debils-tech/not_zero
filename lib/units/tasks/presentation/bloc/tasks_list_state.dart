part of 'tasks_list_bloc.dart';

@freezed
class TasksListState with _$TasksListState {
  const factory TasksListState.loading() = _TasksLoadingState;
  const factory TasksListState.loaded(List<Task> tasks) = _TasksLoadedState;
}
