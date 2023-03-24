import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:not_zero/helpers/object_id_mixin.dart';
import 'package:not_zero/units/tags/domain/models/tag.dart';
import 'package:not_zero/units/tasks/domain/models/task_importance.dart';
import 'package:uuid/uuid.dart';

export 'package:not_zero/units/tasks/domain/models/task_importance.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
class Task with _$Task, ObjectIdMixin implements Comparable<Task> {
  factory Task({
    required String id,
    required String title,
    required TaskImportance importance,
    required DateTime createdAt,
    @Default('') String description,
    DateTime? modifiedAt,
    DateTime? completedAt,
    @JsonKey(toJson: Task._tagsToJson) @Default([]) List<ItemTag> tags,
  }) = _Task;

  const Task._();

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  factory Task.create({
    required String title,
    required TaskImportance importance,
    String? description,
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
    if (isCompleted != other.isCompleted) {
      if (isCompleted) {
        // Moving back completed tasks
        return -1;
      }
      // Moving forward not completed tasks
      return 1;
    }

    // Sorting by importance
    if (importance != other.importance) {
      if (importance.index < other.importance.index) {
        // Moving back less important tasks
        return -1;
      }
      // Moving forward more important tasks
      return 1;
    }

    // Sorting by time that task was created
    return createdAt.compareTo(other.createdAt);
  }

  static List<String> _tagsToJson(List<ItemTag> field) =>
      field.map((e) => e.id).toList();
}
