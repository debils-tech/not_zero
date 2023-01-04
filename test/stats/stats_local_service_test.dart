import 'package:flutter_test/flutter_test.dart';
import 'package:not_zero/get_it.dart';
import 'package:not_zero/units/stats/data/services/stats_local_service.dart';
import 'package:not_zero/units/tasks/domain/models/task.dart';

import '../global_init.dart';
import '../tasks/tasks_db_config.dart';
import '../tasks/template_tasks.dart';

void main() {
  globalInit();
  configDatabaseForTasks(templateTasks3);

  test('Get all tasks importance', () async {
    final serivce = getIt<StatsLocalService>();

    final tasks = await serivce.getCompletedTasksImportance();

    // Sorting is necessary since DB doesn't guarantee the right order.
    tasks.sort((a, b) => a.index.compareTo(b.index));

    expect(
      tasks,
      [
        TaskImportance.notImportant,
        TaskImportance.normal,
        TaskImportance.normal,
        TaskImportance.important
      ],
    );
  });
}
