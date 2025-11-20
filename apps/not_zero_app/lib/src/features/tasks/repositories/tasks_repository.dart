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

import 'package:not_zero_app/src/features/tasks/models/task_action.dart';
import 'package:not_zero_app/src/features/tasks/models/tasks_filters.dart';
import 'package:not_zero_app/src/features/tasks/services/tasks_local_service.dart';
import 'package:nz_actions_bus/nz_actions_bus.dart';
import 'package:nz_base_models/nz_base_models.dart';
import 'package:nz_common/nz_common.dart';

class TasksRepository implements BaseRepository {
  const TasksRepository(this._localService, this._actionsBus);

  final TasksLocalService _localService;
  final ActionsBus _actionsBus;

  Future<List<Task>> getTasks(TasksFilters filters) {
    return _localService.getTasks(filters);
  }

  Future<void> addTask(Task task) async {
    _actionsBus.emit(TaskAction.created(task: task));
    return _localService.saveTask(task);
  }

  Future<void> updateTask({
    required Task oldTask,
    required Task newTask,
  }) async {
    _actionsBus.emit(TaskAction.updated(oldTask: oldTask, newTask: newTask));

    return _localService.saveTask(newTask);
  }

  Future<void> deleteTask(Task task) async {
    _actionsBus.emit(TaskAction.deleted(tasks: [task]));

    return _localService.deleteTasks([task.id]);
  }

  Future<void> deleteMultipleTasks(Iterable<Task> tasks) async {
    _actionsBus.emit(TaskAction.deleted(tasks: tasks));

    return _localService.deleteTasks(tasks.map((t) => t.id));
  }

  Future<void> cancelMultipleTasks(Iterable<Task> tasks) {
    return _localService.updateTasks(tasks);
  }
}
