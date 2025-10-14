import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero_app/src/features/tasks/models/tasks_filters.dart';
import 'package:nz_base_models/nz_base_models.dart';

class TasksFiltersNotifier extends Notifier<TasksFilters> {
  @override
  TasksFilters build() {
    return TasksFilters(forDate: DateTime.now(), canceled: false);
  }

  void selectTag(ItemTag tag) {
    state = state.copyWith(searchTags: {tag.id});
  }

  void unSelectTag(ItemTag tag) {
    state = state.copyWith(searchTags: {});
  }

  void selectDay(DateTime day) {
    state = state.toggleForDate(day);
  }

  void toggleSomeday() {
    state = state.toggleSomeday();
  }

  void showCanceled() {
    state = state.copyWith(canceled: null);
  }

  void hideCanceled() {
    state = state.copyWith(canceled: false);
  }

  void resetFilters() {
    state = build();
  }
}
