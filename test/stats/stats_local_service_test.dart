import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:not_zero/get_it.dart';
import 'package:not_zero/units/stats/data/services/stats_local_service.dart';
import 'package:not_zero/units/tasks/domain/models/task.dart';

import '../tasks/tasks_db_config.dart';
import '../tasks/template_tasks.dart';

void main() {
  configureDependencies();
  configDatabaseForTasks(templateTasks3);

  final serivce = getIt<StatsLocalService>();

  test('Get all tasks importance', () async {
    final tasks = await serivce.getCompletedTasksImportance();

    // Sorting is necessary since DB doesn't guarantee the right order.
    tasks.sort((a, b) => a.index.compareTo(b.index));

    expect(
      listEquals(tasks, [
        TaskImportance.notImportant,
        TaskImportance.normal,
        TaskImportance.normal,
        TaskImportance.important
      ]),
      true,
    );
  });
}
