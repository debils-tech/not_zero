import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero/units/tasks/models/tasks_filters.dart';
import 'package:nz_tags_models/nz_tags_models.dart';

class TasksFiltersNotifier extends AutoDisposeNotifier<TasksFilters> {
  @override
  TasksFilters build() {
    return TasksFilters(forDate: DateTime.now());
  }

  void selectTag(ItemTag tag) {
    state = state.copyWith(searchTags: {tag.id});
  }

  void unSelectTag(ItemTag tag) {
    state = state.copyWith(searchTags: {});
  }

  void selectDay(DateTime day) {
    state = state.copyWith(forDate: day);
  }
}
