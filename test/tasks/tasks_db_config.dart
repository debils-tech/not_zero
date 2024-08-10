import 'package:flutter_test/flutter_test.dart';
import 'package:not_zero/db/provider.dart';
import 'package:not_zero/get_it.dart';
import 'package:nz_drift/nz_drift.dart';
import 'package:nz_tasks_models/nz_tasks_models.dart';

import 'template_tasks.dart';

void configDatabaseForTasks([List<Task>? tasks]) {
  // Prepare some tasks for testing service functions.
  setUp(() async {
    final db = getIt<StorageProvider>().database;
    await db.transaction(() async {
      for (final t in tasks ?? templateTasks1) {
        await db.upsertIn(db.tasksTable, t.toInsertable());
      }
    });
  });

  tearDown(() => getIt<StorageProvider>().database.drop());
}
