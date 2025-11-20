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
import 'package:not_zero_app/src/features/stats/models/tasks_counting_data.dart';
import 'package:nz_base_models/nz_base_models.dart';
import 'package:nz_common/nz_common.dart';
import 'package:nz_drift/nz_drift.dart';

class TasksStatsLocalService implements BaseService {
  const TasksStatsLocalService(this._db);

  final NotZeroDatabase _db;

  Future<TasksCountingData> countTaskStats({
    DateTime? startPeriod,
    DateTime? endPeriod,
  }) async {
    const enumConverter = EnumIndexConverter(TaskImportance.values);
    return _db.transaction(() async {
      return TasksCountingData(
        notImportant: await _completedInPeriodByImportance(
          importance: enumConverter.toSql(.notImportant),
          startPeriod: startPeriod,
          endPeriod: endPeriod,
        ),
        normal: await _completedInPeriodByImportance(
          importance: enumConverter.toSql(.normal),
          startPeriod: startPeriod,
          endPeriod: endPeriod,
        ),
        important: await _completedInPeriodByImportance(
          importance: enumConverter.toSql(.important),
          startPeriod: startPeriod,
          endPeriod: endPeriod,
        ),
        created: await _createdInPeriod(
          startPeriod: startPeriod,
          endPeriod: endPeriod,
        ),
      );
    });
  }

  Future<int> _completedInPeriodByImportance({
    required int importance,
    DateTime? startPeriod,
    DateTime? endPeriod,
  }) async {
    final query = _db.selectOnly(_db.tasksTable)
      ..addColumns({countAll()})
      ..where(
        _db.tasksTable.completedAt.inPeriod(startPeriod, endPeriod) &
            _db.tasksTable.importance.equals(importance),
      );
    final result = await query.getSingleOrNull();
    return result?.read(countAll()) ?? 0;
  }

  Future<int> _createdInPeriod({
    DateTime? startPeriod,
    DateTime? endPeriod,
  }) async {
    final query = _db.selectOnly(_db.tasksTable)
      ..addColumns({countAll()})
      ..where(_db.tasksTable.createdAt.inPeriod(startPeriod, endPeriod));
    final result = await query.getSingleOrNull();
    return result?.read(countAll()) ?? 0;
  }
}
