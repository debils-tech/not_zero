import 'package:flutter_test/flutter_test.dart';
import 'package:not_zero/constants/database.dart';
import 'package:not_zero/get_it.dart';
import 'package:not_zero/units/tasks/domain/models/task.dart';
import 'package:not_zero_storage/not_zero_database.dart';

import 'template_tasks.dart';

Collection getTasksCollection() =>
    getIt<DatabaseProvider>().collections[LocalCollections.tasks];

void configDatabaseForTasks([List<Task>? tasks]) {
  // Initialize DB before all tests.
  setUpAll(() async {
    await getIt<DatabaseProvider>().init();
  });

  // Prepare some tasks for testing service functions.
  setUp(() async {
    final collection = getTasksCollection();
    for (final t in tasks ?? templateTasks1) {
      await collection.insert(t.toJson());
    }
  });

  // Clear DB after every test.
  tearDown(getIt<DatabaseProvider>().drop);
}
