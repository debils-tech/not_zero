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

part of 'migrations.dart';

Future<void> _from7To8(Migrator m, Schema8 schema) async {
  await m.createTable(schema.checkInTable);

  final sortedDates = await _getAllModifiedDatesV8(m, schema);
  if (sortedDates.isEmpty) return;
  await _insertCheckInsV8(m, schema, sortedDates);
}

Future<List<DateTime>> _getAllModifiedDatesV8(
  Migrator m,
  Schema8 schema,
) async {
  final allTimestamps = <DateTime>[];

  void addTimestamp(int? value) {
    if (value == null) return;
    allTimestamps.add(DateTime.fromMillisecondsSinceEpoch(value * 1000));
  }

  void addDate(String? value) {
    if (value == null) return;
    try {
      allTimestamps.add(const DateConverter().fromSql(value));
    } on Object catch (_) {
      // Ignore invalid formats
    }
  }

  // Tasks
  final tasksQuery = m.database.selectOnly(schema.tasksTable)
    ..addColumns([
      schema.tasksTable.createdAt,
      schema.tasksTable.modifiedAt,
      schema.tasksTable.completedAt,
    ]);
  final tasks = await tasksQuery.get();
  for (final row in tasks) {
    addTimestamp(row.read(schema.tasksTable.createdAt));
    addTimestamp(row.read(schema.tasksTable.modifiedAt));
    addTimestamp(row.read(schema.tasksTable.completedAt));
  }

  // Habits
  final habitsQuery = m.database.selectOnly(schema.habitsTable)
    ..addColumns([
      schema.habitsTable.createdAt,
      schema.habitsTable.modifiedAt,
    ]);
  final habits = await habitsQuery.get();
  for (final row in habits) {
    addTimestamp(row.read(schema.habitsTable.createdAt));
    addTimestamp(row.read(schema.habitsTable.modifiedAt));
  }

  // Habit Completions
  final completionsQuery = m.database.selectOnly(schema.habitCompletionsTable)
    ..addColumns([
      schema.habitCompletionsTable.completedDate,
    ]);
  final completions = await completionsQuery.get();
  for (final row in completions) {
    addDate(row.read(schema.habitCompletionsTable.completedDate));
  }

  // Tags
  final tagsQuery = m.database.selectOnly(schema.tagsTable)
    ..addColumns([
      schema.tagsTable.createdAt,
    ]);
  final tags = await tagsQuery.get();
  for (final row in tags) {
    addTimestamp(row.read(schema.tagsTable.createdAt));
  }

  // Unique days sorted
  // Use UTC to avoid DST issues when calculating difference in days
  final sortedDates =
      allTimestamps
          .map((e) => DateTime.utc(e.year, e.month, e.day))
          .toSet()
          .toList()
        ..sort();

  return sortedDates;
}

Future<void> _insertCheckInsV8(
  Migrator m,
  Schema8 schema,
  List<DateTime> sortedDates,
) async {
  var currentStreak = 0;
  DateTime? lastDate;
  for (final date in sortedDates) {
    if (lastDate == null) {
      currentStreak = 1;
    } else {
      final diff = date.difference(lastDate).inDays;
      if (diff == 1) {
        currentStreak++;
      } else {
        currentStreak = 1;
      }
    }
    lastDate = date;

    final checkIn = AppDailyCheckIn.create(
      checkInDate: date,
      streakCount: currentStreak,
    );
    await m.database
        .into(schema.checkInTable)
        .insert(
          RawValuesInsertable(
            checkIn.toInsertable().toColumns(false),
          ),
        );
  }
}
