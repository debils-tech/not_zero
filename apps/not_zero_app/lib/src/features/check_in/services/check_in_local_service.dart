import 'package:drift/drift.dart';
import 'package:nz_base_models/nz_base_models.dart';
import 'package:nz_common/nz_common.dart';
import 'package:nz_drift/nz_drift.dart';

class CheckInLocalService implements BaseService {
  const CheckInLocalService(this._db);

  final NotZeroDatabase _db;

  Future<AppDailyCheckIn?> getLastCheckIn({required DateTime streakDate}) {
    return (_db.select(_db.checkInTable)
              ..where(
                (tbl) => tbl.checkInDate.dayInRange(null, streakDate),
              )
              ..orderBy([(tbl) => OrderingTerm.desc(tbl.checkInDate)])
              ..limit(1))
            .getSingleOrNull();
  }

  Future<void> saveCheckIn(AppDailyCheckIn checkIn) {
    return _db.into(_db.checkInTable).insert(checkIn.toInsertable());
  }
}
