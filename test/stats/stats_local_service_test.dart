import 'package:flutter_test/flutter_test.dart';
import 'package:not_zero/get_it.dart';
import 'package:not_zero/helpers/date_transformations.dart';
import 'package:not_zero/units/stats/data/services/stats_local_service.dart';
import 'package:not_zero/units/tasks/domain/models/task.dart';

import '../global_init.dart';
import '../tasks/tasks_db_config.dart';
import '../tasks/template_tasks.dart';

void main() {
  globalInit();
  configDatabaseForTasks(templateTasks4);
  /*
  not important at 31.12.2022
  normal at 01.01.2023
  important at 03.01.2023
  not important at 03.01.2023
  normal at 05.01.2023
  */

  test('Get all tasks importance', () async {
    final service = getIt<StatsLocalService>();

    final tasks = await service.getCompletedTasksImportance();

    expect(
      _sortImportance(tasks),
      [
        TaskImportance.notImportant,
        TaskImportance.notImportant,
        TaskImportance.normal,
        TaskImportance.normal,
        TaskImportance.important,
      ],
    );
  });

  group('Get tasks in ranges', () {
    test('Without lower bound', () async {
      final service = getIt<StatsLocalService>();

      final tasks = await service.getCompletedTasksImportance(
        endPeriod: DateTime(2023, 1, 2),
      );

      expect(
        _sortImportance(tasks),
        [
          TaskImportance.notImportant,
          TaskImportance.normal,
        ],
      );
    });

    test('Without upper bound', () async {
      final service = getIt<StatsLocalService>();

      final tasks = await service.getCompletedTasksImportance(
        startPeriod: DateTime(2023, 1, 2),
      );

      expect(
        _sortImportance(tasks),
        [
          TaskImportance.notImportant,
          TaskImportance.normal,
          TaskImportance.important,
        ],
      );
    });

    test('With lower and upper bounds', () async {
      final service = getIt<StatsLocalService>();

      final tasks = await service.getCompletedTasksImportance(
        startPeriod: DateTime(2023),
        endPeriod: DateTime(2023, 1, 3, 23, 59),
      );

      expect(
        _sortImportance(tasks),
        [
          TaskImportance.notImportant,
          TaskImportance.normal,
          TaskImportance.important,
        ],
      );
    });

    test('With bounds without tasks', () async {
      final service = getIt<StatsLocalService>();

      final notNiceDay = DateTime(2022, 12, 30);
      final tasks = await service.getCompletedTasksImportance(
        startPeriod: notNiceDay.startOfDay,
        endPeriod: notNiceDay.endOfDay,
      );

      expect(
        _sortImportance(tasks),
        <TaskImportance>[],
      );
    });
  });
}

/// Sorting is necessary for testing since DB doesn't guarantee the right order.
List<TaskImportance> _sortImportance(List<TaskImportance> importances) {
  importances.sort((a, b) => a.index.compareTo(b.index));
  return importances;
}
