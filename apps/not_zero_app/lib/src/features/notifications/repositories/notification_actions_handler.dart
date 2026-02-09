// Not Zero, cross-platform wellbeing application.
// Copyright (C) 2026 Nagorny Vladislav
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

import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';
import 'package:not_zero_app/src/features/habits/services/habits_local_service.dart';
import 'package:not_zero_app/src/features/notifications/constants/notification_action_ids.dart';
import 'package:not_zero_app/src/features/notifications/models/app_notification_payload.dart';
import 'package:not_zero_app/src/features/tasks/services/tasks_local_service.dart';
import 'package:nz_base_models/nz_base_models.dart';

class NotificationActionsHandler {
  const NotificationActionsHandler(
    this._tasksLocalService,
    this._habitsLocalService,
    this._router,
  );

  final TasksLocalService _tasksLocalService;
  final HabitsLocalService _habitsLocalService;
  final ValueGetter<GoRouter> _router;

  static final _log = Logger('NotificationActionsHandler');

  Future<void> handleAction(
    int? notificationId,
    String? actionId,
    AppNotificationPayload payload,
  ) async => switch ((actionId, payload)) {
    (null, AppNotificationPayloadTaskReminder(:final taskId)) => _openTask(
      taskId,
    ),
    (null, AppNotificationPayloadHabitReminder(:final habitId)) => _openHabit(
      habitId,
    ),
    (
      NotificationActionIds.complete,
      AppNotificationPayloadTaskReminder(:final taskId, :final forDateTime),
    ) =>
      _completeTask(taskId, forDateTime),
    (
      NotificationActionIds.complete,
      AppNotificationPayloadHabitReminder(:final habitId, :final forDateTime),
    ) =>
      _completeHabit(habitId, forDateTime),
    _ => _log.severe('Unknown action: $actionId, $payload'),
  };

  Future<void> _openTask(String taskId) async {
    final taskModel = await _tasksLocalService.getTaskById(taskId);
    if (taskModel == null) return;
    _router().go('/tasks/view/${taskModel.id}', extra: taskModel);
  }

  Future<void> _openHabit(String _) async {
    // FIXME(uSlashVlad): Don't open habit screen since it is absolutely empty.
    _router().go('/habits');
  }

  Future<void> _completeTask(
    String taskId,
    DateTime? notificationDateTime,
  ) async {
    // FIXME(uSlashVlad): If app is opened, state wouldn't update...
    final taskModel = await _tasksLocalService.getTaskById(taskId);
    if (taskModel == null) return;
    final newTask = taskModel.copyWith(
      completedAt: notificationDateTime ?? DateTime.now(),
      modifiedAt: DateTime.now(),
    );
    await _tasksLocalService.saveTask(newTask);
  }

  Future<void> _completeHabit(
    String habitId,
    DateTime? notificationDateTime,
  ) async {
    // FIXME(uSlashVlad): If app is opened, state wouldn't update...
    final completion = HabitCompletion.create(
      habitId: habitId,
      completedDate: notificationDateTime ?? DateTime.now(),
    );
    await _habitsLocalService.saveCompletion(completion);
  }
}
