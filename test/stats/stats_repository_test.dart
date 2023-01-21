import 'package:flutter_test/flutter_test.dart';
import 'package:not_zero/get_it.dart';
import 'package:not_zero/units/stats/domain/repositories/stats_repository.dart';

import '../global_init.dart';
import '../tasks/tasks_db_config.dart';
import '../tasks/template_tasks.dart';

void main() {
  const notImportantScore = 3;
  const normalScore = 5;
  const importantScore = 8;
  const expectedTasksSum =
      notImportantScore + normalScore + normalScore + importantScore;

  globalInit();
  configDatabaseForTasks(templateTasks3);

  // Clear repository for eliminating results of previous test.
  tearDown(() {
    getIt.resetLazySingleton<StatsRepository>();
  });

  test('Loading initial state', () async {
    final repository = getIt<StatsRepository>();

    expect(
      repository.getTotalPoints(),
      emitsInOrder([-1, expectedTasksSum]),
    );

    await repository.countTotalPoints();
  });

  test('Including completed tasks', () async {
    final repository = getIt<StatsRepository>();

    await repository.countTotalPoints();

    expect(
      repository.getTotalPoints(),
      emitsInOrder([
        expectedTasksSum,
        expectedTasksSum + normalScore,
        expectedTasksSum + normalScore + notImportantScore,
      ]),
    );

    repository
      ..includeCompletedTask(templateTasks3[0].importance)
      ..includeCompletedTask(templateTasks3[1].importance);
  });

  test('Exclude completed tasks', () async {
    final repository = getIt<StatsRepository>();

    await repository.countTotalPoints();

    expect(
      repository.getTotalPoints(),
      emitsInOrder([
        expectedTasksSum,
        expectedTasksSum - normalScore,
        expectedTasksSum - normalScore - notImportantScore,
      ]),
    );

    repository
      ..excludeCompletedTask(templateTasks1[0].importance)
      ..excludeCompletedTask(templateTasks1[1].importance);
  });

  test('Combine include and exclude', () async {
    final repository = getIt<StatsRepository>();

    await repository.countTotalPoints();

    expect(
      repository.getTotalPoints(),
      emitsInOrder([
        expectedTasksSum,
        expectedTasksSum + normalScore,
        expectedTasksSum + normalScore - notImportantScore,
      ]),
    );

    repository
      ..includeCompletedTask(templateTasks1[0].importance)
      ..excludeCompletedTask(templateTasks1[1].importance);
  });
}
