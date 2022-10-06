import 'package:not_zero/get_it.dart';
import 'package:not_zero/units/stats/domain/repositories/stats_repository.dart';
import 'package:not_zero_storage/not_zero_database.dart';

class InitializationHelper {
  InitializationHelper._();

  static Future<void> initDatabaseRelated() async {
    await getIt<DatabaseProvider>().init();
    await getIt<StatsRepository>().countTotalPoints();
  }
}
