import 'package:freezed_annotation/freezed_annotation.dart';

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
    required TaskImportance importance,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}
