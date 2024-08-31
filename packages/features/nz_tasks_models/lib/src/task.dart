import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nz_common/nz_common.dart';
import 'package:nz_tags_models/nz_tags_models.dart';
import 'package:nz_tasks_models/src/task_importance.dart';
import 'package:uuid/uuid.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
class Task with _$Task, ObjectIdMixin implements Comparable<Task> {
  factory Task({
    required String id,
    required String title,
    required TaskImportance importance,
    required DateTime createdAt,
    required DateTime forDate,
    @Default('') String description,
    DateTime? modifiedAt,
    DateTime? completedAt,
    @Default(false) bool persistent,
    @JsonKey(
      toJson: Task._tagsToJson,
      includeToJson: true,
      includeFromJson: false,
    )
    @Default([])
    List<ItemTag> tags,
  }) = _Task;

  const Task._();

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  factory Task.create({
    required String title,
    required TaskImportance importance,
    DateTime? forDate, // TODO(uSlashVlad): Make it required
    String? description,
    List<ItemTag>? tags,
  }) =>
      Task(
        id: const Uuid().v4(),
        title: title,
        description: description ?? '',
        createdAt: DateTime.now(),
        forDate: forDate ?? DateTime.now(),
        importance: importance,
        tags: tags ?? [],
      );

  Task edit({
    String? title,
    String? description,
    TaskImportance? importance,
    List<ItemTag>? tags,
    DateTime? forDate,
  }) =>
      copyWith(
        title: title ?? this.title,
        description: description ?? this.description,
        importance: importance ?? this.importance,
        modifiedAt: DateTime.now(),
        forDate: forDate ?? this.forDate,
        tags: tags ?? this.tags,
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
