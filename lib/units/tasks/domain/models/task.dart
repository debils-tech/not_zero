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
  important,
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
}
