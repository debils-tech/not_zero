import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:not_zero/helpers/object_id_mixin.dart';
import 'package:uuid/uuid.dart';

part 'task.freezed.dart';
part 'task.g.dart';

enum TaskImportance {
  notImportant,
  normal,
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
class Task with _$Task, ObjectIdMixin implements Comparable<Task> {
  factory Task({
    required String id,
    required String title,
    @Default('') String description,
    required DateTime createdAt,
    DateTime? modifiedAt,
    DateTime? completedAt,
    required TaskImportance importance,
  }) = _Task;

  const Task._();

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

  Task edit({
    String? title,
    String? description,
    TaskImportance? importance,
  }) =>
      copyWith(
        title: title ?? this.title,
        description: description ?? this.description,
        importance: importance ?? this.importance,
        modifiedAt: DateTime.now(),
      );

  Task complete({required bool completed}) => copyWith(
        completedAt: completed ? DateTime.now() : null,
      );

  bool get isCompleted => completedAt != null;

  @override
  int compareTo(Task other) {
    // Sorting by completeness
    if (isCompleted && !other.isCompleted) {
      // Moving back completed tasks
      return -1;
    } else if (!isCompleted && other.isCompleted) {
      // Moving forward not completed tasks
      return 1;
    }

    // Sorting by importance
    if (importance.index < other.importance.index) {
      // Moving back less important tasks
      return -1;
    } else if (importance.index > other.importance.index) {
      // Moving forward more important tasks
      return 1;
    }

    // Sorting by time that task was created
    return createdAt.compareTo(other.createdAt);
  }
}
