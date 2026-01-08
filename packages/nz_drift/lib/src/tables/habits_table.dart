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
import 'package:nz_drift/src/converters/date_converter.dart';
import 'package:nz_drift/src/converters/string_reminder_time_converter.dart';

@UseRowClass(Habit, generateInsertable: true)
class HabitsTable extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get description => text().withDefault(const Constant(''))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get modifiedAt => dateTime().nullable()();
  IntColumn get importance => intEnum<TaskImportance>()();
  TextColumn get reminderTime =>
      text().map(const StringReminderTimeConverter()).nullable()();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}

@UseRowClass(HabitCompletion, generateInsertable: true)
class HabitCompletionsTable extends Table {
  TextColumn get id => text()();
  TextColumn get habitId => text().references(HabitsTable, #id)();
  IntColumn get type => intEnum<HabitCompletionType>()();
  TextColumn get completedDate => text().map(const DateConverter())();
  IntColumn get streakCount => integer().withDefault(const Constant(1))();

  @override
  Set<Column<Object>>? get primaryKey => {id};

  @override
  List<Set<Column<Object>>>? get uniqueKeys => [
    {habitId, completedDate},
  ];
}
