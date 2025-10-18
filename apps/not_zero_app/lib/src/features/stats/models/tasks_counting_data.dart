import 'package:freezed_annotation/freezed_annotation.dart';

part 'tasks_counting_data.freezed.dart';

@freezed
abstract class TasksCountingData with _$TasksCountingData {
  const factory TasksCountingData({
    required int notImportant,
    required int normal,
    required int important,
    required int created,
  }) = _TasksCountingData;
}
