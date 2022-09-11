import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:not_zero/helpers/date_time_epoch_json.dart';
import 'package:uuid/uuid.dart';

part 'task.freezed.dart';
part 'task.g.dart';

enum TaskImportance {
  @JsonValue(1)
  notImportant,
  @JsonValue(3)
  normal,
  @JsonValue(5)
  important;

  factory TaskImportance.fromIndex(int? index) {
    switch (index) {
      case 0:
        return TaskImportance.notImportant;
      case 1:
        return TaskImportance.normal;
      case 2:
        return TaskImportance.important;
      default:
        return TaskImportance.normal;
    }
  }

  int toIndex() {
    switch (this) {
      case TaskImportance.notImportant:
        return 0;
      case TaskImportance.normal:
        return 1;
      case TaskImportance.important:
        return 2;
    }
  }
}

@freezed
class Task with _$Task {
  factory Task({
    required String id,
    required String title,
    @Default('') String description,
    @DateTimeEpochConverter() required DateTime createdAt,
    @DateTimeEpochConverter() DateTime? modifiedAt,
    required TaskImportance importance,
    @Default(false) bool isCompleted,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  factory Task.create({
    required String title,
    String? description,
    required TaskImportance importance,
  }) =>
      Task(
        id: const Uuid().v4(),
        title: title,
        description: description ?? '',
        createdAt: DateTime.now(),
        importance: importance,
      );

  factory Task.edit({
    required Task task,
    String? title,
    String? description,
    TaskImportance? importance,
  }) =>
      task.copyWith(
        title: title ?? task.title,
        description: description ?? task.description,
        importance: importance ?? task.importance,
        modifiedAt: DateTime.now(),
      );
}
