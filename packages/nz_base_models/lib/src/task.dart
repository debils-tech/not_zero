import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nz_base_models/src/tag.dart';
import 'package:nz_base_models/src/task_importance.dart';
import 'package:nz_common/nz_common.dart';
import 'package:uuid/uuid.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
abstract class Task with _$Task, ObjectIdMixin implements Comparable<Task> {
  factory Task({
    required String id,
    required String title,
    required TaskImportance importance,
    required DateTime createdAt,
    @Default('') String description,
    DateTime? modifiedAt,
    DateTime? completedAt,
    DateTime? canceledAt,
    DateTime? forDate,
    @Default(true) bool persistent,
    @JsonKey(toJson: Task._tagsToJson) @Default([]) List<ItemTag> tags,
  }) = _Task;

  const Task._();

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  factory Task.create({
    required String title,
    required TaskImportance importance,
    String? description,
    List<ItemTag>? tags,
    DateTime? forDate,
    bool? persistent,
  }) => Task(
    id: const Uuid().v4(),
    title: title,
    description: description ?? '',
    createdAt: DateTime.now(),
    importance: importance,
    tags: tags ?? [],
    forDate: forDate,
    persistent: persistent ?? true,
  );

  Task edit({
    String? title,
    String? description,
    TaskImportance? importance,
    List<ItemTag>? tags,
    DateTime? forDate,
    bool? persistent,
  }) => copyWith(
    title: title ?? this.title,
    description: description ?? this.description,
    importance: importance ?? this.importance,
    modifiedAt: DateTime.now(),
    forDate: forDate ?? this.forDate,
    tags: tags ?? this.tags,
    persistent: persistent ?? this.persistent,
  );

  Task complete({required bool completed}) => copyWith(
    completedAt: completed ? DateTime.now() : null,
    canceledAt: null,
  );

  bool get isCompleted => completedAt != null;

  Task cancel({required bool canceled}) =>
      copyWith(canceledAt: canceled ? DateTime.now() : null, completedAt: null);

  bool get isCanceled => canceledAt != null;

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
