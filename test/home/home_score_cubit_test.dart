import 'package:flutter_test/flutter_test.dart';
import 'package:not_zero/get_it.dart';
import 'package:not_zero/units/home/presentation/bloc/home_score_cubit.dart';
import 'package:not_zero/units/home/presentation/bloc/states/home_score_state.dart';

import '../async.dart';
import '../global_init.dart';
import '../tasks/tasks_db_config.dart';
import '../tasks/template_tasks.dart';

void main() {
  globalInit();
  configDatabaseForTasks(templateTasks3);

  test('Score loading', () async {
    final cubit = getIt<HomeScoreCubit>();

    expect(cubit.state, const HomeScoreState());

    await testCubitSingle(
      cubit,
      cubit.init,
      const HomeScoreState(totalPoints: 5 + 3 + 8 + 5),
    );
  });

  // TODO(uSlashVlad): Test score updating.
}
