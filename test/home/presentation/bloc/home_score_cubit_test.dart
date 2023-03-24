import 'package:flutter_test/flutter_test.dart';
import 'package:not_zero/get_it.dart';
import 'package:not_zero/units/home/presentation/bloc/home_score_cubit.dart';
import 'package:not_zero/units/home/presentation/bloc/home_score_state.dart';
import 'package:not_zero/units/stats/domain/repositories/stats_repository.dart';
import 'package:not_zero/units/tasks/domain/repositories/tasks_repository.dart';

import '../../../global_init.dart';
import '../../../tasks/tasks_db_config.dart';
import '../../../tasks/template_tasks.dart';

void main() {
  globalInit();
  configDatabaseForTasks(templateTasks3);

  tearDown(() {
    getIt.resetLazySingleton<StatsRepository>();
  });

  const baseScore = 5 + 3 + 8 + 5;

  test('Score loading', () async {
    final cubit = getIt<HomeScoreCubit>();
    expect(cubit.state, const HomeScoreState());

    await cubit.init();
    await expectLater(
      cubit.stream,
      emits(const HomeScoreState(totalPoints: baseScore)),
    );
  });

  test('Task complete', () async {
    final cubit = getIt<HomeScoreCubit>();
    final taskRepo = getIt<TasksRepository>();

    expect(
      cubit.stream,
      emitsInOrder([
        const HomeScoreState(),
        const HomeScoreState(totalPoints: baseScore),
        const HomeScoreState(totalPoints: baseScore + 8),
        const HomeScoreState(totalPoints: baseScore + 8 - 5),
      ]),
    );

    await cubit.init();
    await taskRepo.syncTasks();

    await taskRepo.updateTask(templateTasks3[2].complete(completed: true));

    await taskRepo.updateTask(templateTasks3[0].complete(completed: false));
  });
}
