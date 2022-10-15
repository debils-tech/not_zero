import 'package:flutter_test/flutter_test.dart';
import 'package:not_zero/db/provider.dart';
import 'package:not_zero/get_it.dart';
import 'package:not_zero/units/tasks/domain/models/task.dart';

import 'template_tasks.dart';

void configDatabaseForTasks([List<Task>? tasks]) {
  // Prepare some tasks for testing service functions.
  setUp(() async {
    final db = getIt<StorageProvider>().database;
    for (final t in tasks ?? templateTasks1) {
      await db.into(db.tasksTable).insert(t.toInsertable());
    }
  });

  tearDown(getIt<StorageProvider>().database.drop);
}
