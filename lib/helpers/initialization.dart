import 'dart:async';

import 'package:not_zero/db/provider.dart';
import 'package:not_zero/get_it.dart';
import 'package:not_zero/units/stats/domain/repositories/stats_repository.dart';

class InitializationHelper {
  InitializationHelper._();

  static Future<void> initDatabaseRelated() async {
    await getIt<StorageProvider>().init();
    unawaited(getIt<StatsRepository>().countTotalPoints());
  }
}
