// Not Zero, cross-platform wellbeing application.
// Copyright (C) 2025 Nagorny Vladislav
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

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
    state = state.copyWith(forDate: day, someday: false);
  }

  void toggleSomeday() {
    state = state.copyWith(someday: !state.someday);
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
