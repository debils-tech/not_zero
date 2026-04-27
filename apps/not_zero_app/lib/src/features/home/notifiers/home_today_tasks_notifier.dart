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
import 'package:not_zero_app/src/features/tasks/di.dart';
import 'package:not_zero_app/src/features/tasks/models/task_action.dart';
import 'package:not_zero_app/src/features/tasks/models/tasks_filters.dart';
import 'package:not_zero_app/src/helpers/ref_actions_extension.dart';
import 'package:nz_base_models/nz_base_models.dart';

class HomeTodayTasksNotifier extends AsyncNotifier<List<Task>> {
  @override
  Future<List<Task>> build() async {
    ref.listenActions<TaskAction>(_handleTaskAction);
    return _loadTasks();
  }

  void _handleTaskAction(TaskAction action) {
    switch (action) {
      case TaskActionCreated() ||
          TaskActionUpdated() ||
          TaskActionDeletedMultiple():
        ref.invalidateSelf();
    }
  }

  Future<List<Task>> _loadTasks() async {
    final repository = ref.watch(tasksRepositoryProvider);
    final tasks = await repository.getTasks(
      TasksFilters(
        forDate: DateTime.now(),
        canceled: false,
      ),
    );
    return tasks.where((task) => !task.isCompleted).toList();
  }
}
