import 'dart:async';

import 'package:not_zero/get_it.dart';
import 'package:not_zero/units/stats/domain/repositories/stats_repository.dart';

class InitializationHelper {
  InitializationHelper._();

  // TODO refactor this function because it might be useless with new database.
  static Future<void> initDatabaseRelated() async {
    unawaited(getIt<StatsRepository>().countTotalPoints());
  }
}
