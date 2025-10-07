import 'package:freezed_annotation/freezed_annotation.dart';

part 'tasks_filters.freezed.dart';

@freezed
abstract class TasksFilters with _$TasksFilters {
  const factory TasksFilters({
    @Default(<String>{}) Set<String> searchTags,
    DateTime? forDate,
  }) = _TasksFilters;
}
