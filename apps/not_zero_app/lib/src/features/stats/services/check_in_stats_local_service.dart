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
import 'package:not_zero_app/src/features/stats/models/check_in_couting_data.dart';
import 'package:nz_common/nz_common.dart';
import 'package:nz_drift/nz_drift.dart';

class CheckInStatsLocalService implements BaseRepository {
  const CheckInStatsLocalService(this._db);

  final NotZeroDatabase _db;

  Future<CheckInCoutingData> countCheckInStats({
    DateTime? startPeriod,
    DateTime? endPeriod,
  }) async {
    final checkInsByStreakPeriod = CheckInStreakPeriod.values
        .map<Pair<CheckInStreakPeriod, Expression<int>>>(
          (streak) => (
            streak,
            subqueryExpression(
              _db.selectOnly(_db.checkInTable)
                ..addColumns({countAll()})
                ..where(
                  _db.checkInTable.checkInDate.dayInRange(
                    startPeriod,
                    endPeriod,
                  ),
                )
                ..where(
                  _isInStreakPeriod(_db.checkInTable.streakCount, streak),
                ),
            ),
          ),
        )
        .toList();

    final resultSet = await _db
        .selectExpressions(checkInsByStreakPeriod.map((e) => e.$2))
        .getSingle();

    return CheckInCoutingData(
      checkIns: Map.fromEntries(
        checkInsByStreakPeriod.map(
          (e) => MapEntry(e.$1, resultSet.read(e.$2) ?? 0),
        ),
      ),
    );
  }

  Expression<bool> _isInStreakPeriod(
    Expression<int> streakCount,
    CheckInStreakPeriod streakPeriod,
  ) {
    final maxDays = streakPeriod.maxDays;
    return streakCount.isBiggerOrEqualValue(streakPeriod.minDays) &
        (maxDays == null
            ? const Constant(true)
            : streakCount.isSmallerThanValue(maxDays));
  }
}
