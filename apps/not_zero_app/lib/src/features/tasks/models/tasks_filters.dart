import 'package:freezed_annotation/freezed_annotation.dart';

part 'tasks_filters.freezed.dart';

@freezed
abstract class TasksFilters with _$TasksFilters {
  const factory TasksFilters({
    @Default(<String>{}) Set<String> searchTags,
    DateTime? forDate,
    @Default(false) bool someday,
    // bool? completed,
    bool? canceled,
  }) = _TasksFilters;

  const TasksFilters._();

  TasksFilters toggleForDate(DateTime forDate) =>
      copyWith(forDate: forDate, someday: false);

  TasksFilters toggleSomeday() => copyWith(forDate: null, someday: true);
}
