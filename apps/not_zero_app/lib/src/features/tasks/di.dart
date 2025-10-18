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
    .family<Task?, String>((ref, taskId) async {
      // TODO(uSlashVlad): Doesn't work if a task isn't from the main list :(
      final mainList = await ref.watch(tasksMainListNotifier.future);
      return mainList.firstWhereOrNull((task) => task.id == taskId);
    });

final tasksFiltersNotifier = NotifierProvider.autoDispose(
  TasksFiltersNotifier.new,
);

final tasksMainListNotifier = AsyncNotifierProvider.autoDispose(
  TasksMainListNotifier.new,
);
