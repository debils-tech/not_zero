import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nz_actions_bus/nz_actions_bus.dart';
import 'package:nz_base_models/nz_base_models.dart';

part 'task_action.freezed.dart';

@freezed
sealed class TaskAction extends AppAction with _$TaskAction {
  const factory TaskAction.created({required Task task}) = TaskActionCreated;

  const factory TaskAction.updated({
    required Task oldTask,
    required Task newTask,
  }) = TaskActionUpdated;

  const factory TaskAction.deleted({required Iterable<Task> tasks}) =
      TaskActionDeletedMultiple;

  const TaskAction._();
}
