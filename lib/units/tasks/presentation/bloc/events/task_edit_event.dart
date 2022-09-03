import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:not_zero/units/tasks/domain/models/task.dart';

part 'task_edit_event.freezed.dart';

@freezed
class TaskEditEvent with _$TaskEditEvent {
  const factory TaskEditEvent.changeForm({required bool correct}) =
      ChangeFormEvent;
  const factory TaskEditEvent.saveTask({
    required TaskImportance importance,
    required String title,
    String? description,
  }) = SaveTaskEvent;
}
