import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:not_zero/get_it.dart';
import 'package:not_zero/units/tasks/domain/repositories/tasks_repository.dart';
import 'package:not_zero/units/tasks/presentation/bloc/task_view_cubit.dart';

import '../global_init.dart';
import 'tasks_db_config.dart';
import 'template_tasks.dart';

void main() {
  globalInit();
  configDatabaseForTasks();

  // Clear repository for eliminating results of previous test.
  tearDown(() async {
    getIt.resetLazySingleton<TasksRepository>();
  });

  test('Subscription on init', () async {
    final cubit = getIt<TaskViewCubit>();
    expect(cubit.state, isNull);

    final taskToEdit = templateTasks1.first;
    cubit.init(taskToEdit.id);

    final updatedTask = taskToEdit.edit(
      title: 'New title!',
      description: 'Updated description',
    );
    unawaited(getIt<TasksRepository>().updateTask(updatedTask));
    await expectLater(cubit.stream, emits(updatedTask));

    await cubit.close();
  });
}
