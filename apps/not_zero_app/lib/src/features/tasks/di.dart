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

import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero_app/src/features/actions_bus/di.dart';
import 'package:not_zero_app/src/features/storage/di.dart';
import 'package:not_zero_app/src/features/tasks/notifiers/tasks_filters_notifier.dart';
import 'package:not_zero_app/src/features/tasks/notifiers/tasks_main_list_notifier.dart';
import 'package:not_zero_app/src/features/tasks/repositories/tasks_repository.dart';
import 'package:not_zero_app/src/features/tasks/services/tasks_local_service.dart';
import 'package:nz_base_models/nz_base_models.dart';

final tasksLocalServiceProvider = Provider<TasksLocalService>((ref) {
  return TasksLocalService(
    ref.watch(databaseProvider),
  );
});

final tasksRepositoryProvider = Provider<TasksRepository>((ref) {
  return TasksRepository(
    ref.watch(tasksLocalServiceProvider),
    ref.watch(actionsBusProvider),
  );
});

final specificTaskStreamProvider = FutureProvider.autoDispose
    .family<Task?, String>((
      ref,
      taskId,
    ) {
      return ref.watch(
        tasksMainListNotifier.selectAsync(
          (list) => list.firstWhereOrNull((task) => task.id == taskId),
        ),
      );
    });

final tasksFiltersNotifier = NotifierProvider.autoDispose(
  TasksFiltersNotifier.new,
);

final tasksMainListNotifier = AsyncNotifierProvider.autoDispose(
  TasksMainListNotifier.new,
);
