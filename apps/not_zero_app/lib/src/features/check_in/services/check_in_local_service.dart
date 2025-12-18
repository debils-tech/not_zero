// Not Zero, cross-platform wellbeing application.
// Copyright (C) 2025 Nagorny Vladislav
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

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
