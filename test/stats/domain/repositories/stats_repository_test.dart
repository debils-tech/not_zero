import 'package:flutter_test/flutter_test.dart';
import 'package:not_zero/get_it.dart';
import 'package:not_zero/helpers/date_transformations.dart';
import 'package:not_zero/units/stats/domain/repositories/stats_repository.dart';

import '../../../global_init.dart';
import '../../../tasks/tasks_db_config.dart';
import '../../../tasks/template_tasks.dart';

void main() {
  const notImportantScore = 3;
  const normalScore = 5;
  const importantScore = 8;
  const expectedTasksSum =
      notImportantScore + normalScore + normalScore + importantScore;

  globalInit();

  // Clear repository for eliminating results of previous test.
  tearDown(() {
    getIt.resetLazySingleton<StatsRepository>();
  });

  group('Total count', () {
    configDatabaseForTasks(templateTasks3);

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
  });

  group('Stats in ranges', () {
    configDatabaseForTasks(templateTasks4);
    /*
  ### 27.12.2022 - 02.01.2023 ###
  not important at 31.12.2022 (friday)
  normal at 01.01.2023 (saturday)
  ### 03.01.2023 - 9.01.2023 ###
  important at 03.01.2023
  not important at 03.01.2023
  normal at 05.01.2023
  */

    test('Get points for week by days', () async {
      final repository = getIt<StatsRepository>();

      final week1Stats = await repository.getStatsByDays(
        DateTime(2022, 12, 27),
        DateTime(2023, 1, 2).endOfDay,
      );
      expect(
        week1Stats,
        [
          /*27.12*/ 0,
          /*28.12*/ 0,
          /*29.12*/ 0,
          /*30.12*/ 0,
          /*31.12*/ notImportantScore,
          /*01.01*/ normalScore,
          /*02.01*/ 0,
        ],
      );

      final week2Stats = await repository.getStatsByDays(
        DateTime(2023, 1, 3),
        DateTime(2023, 1, 9).endOfDay,
      );
      expect(
        week2Stats,
        [
          /*03.01*/ notImportantScore + importantScore,
          /*04.01*/ 0,
          /*05.01*/ normalScore,
          /*06.01*/ 0,
          /*07.01*/ 0,
          /*08.01*/ 0,
          /*09.01*/ 0,
        ],
      );
    });
  });
}
