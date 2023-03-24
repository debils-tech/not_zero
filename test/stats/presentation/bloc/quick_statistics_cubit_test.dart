import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:not_zero/get_it.dart';
import 'package:not_zero/helpers/date_transformations.dart';
import 'package:not_zero/units/stats/presentation/bloc/quick_statistics_cubit.dart';
import 'package:not_zero/units/stats/presentation/bloc/quick_statistics_state.dart';

import '../../../global_init.dart';
import '../../../tasks/tasks_db_config.dart';
import '../../../tasks/template_tasks.dart';

void main() {
  globalInit();
  configDatabaseForTasks(templateTasks4);
  /*
  not important at 31.12.2022
  normal        at 01.01.2023
  important     at 03.01.2023
  not important at 03.01.2023
  normal        at 05.01.2023
  */

  test('Basic empty load', () async {
    final cubit = getIt<QuickStatisticsCubit>();
    expect(cubit.state, QuickStatisticsState());

    unawaited(cubit.loadDays());

    final now = DateTime.now();
    await expectLater(
      cubit.stream,
      emits(
        QuickStatisticsState(
          chartStats: List.filled(7, 0),
          chartRangeStart: now.startOfWeek,
          chartRangeEnd: now.endOfWeek,
          selectedDayIndex: now.weekday - 1,
        ),
      ),
    );
  });

  test('Load specific', () async {
    final cubit = getIt<QuickStatisticsCubit>();

    final start = DateTime(2023, 1, 2);
    final end = DateTime(2023, 1, 8).endOfDay;

    unawaited(cubit.loadDays(start, end));
    await expectLater(
      cubit.stream,
      emits(
        QuickStatisticsState(
          chartRangeStart: start,
          chartRangeEnd: end,
          chartStats: [0, 11, 0, 5, 0, 0, 0],
        ),
      ),
    );
  });

  test('Simple day selection', () {
    final cubit = getIt<QuickStatisticsCubit>();

    expect(
      cubit.stream,
      emitsInOrder(
        [
          QuickStatisticsState(selectedDayIndex: 0),
          QuickStatisticsState(selectedDayIndex: 9999),
        ],
      ),
    );

    cubit.selectDay(0);
    cubit.selectDay(-1);
    cubit.selectDay(0);
    cubit.selectDay(9999);
  });
}
