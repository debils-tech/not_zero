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

// coverage:ignore-file

import 'package:drift/drift.dart';
import 'package:nz_base_models/nz_base_models.dart';
import 'package:nz_drift/src/tables/habits_table.dart';
import 'package:nz_drift/src/tables/tasks_table.dart';

@UseRowClass(ItemTag, generateInsertable: true)
class TagsTable extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  IntColumn get colorIndex => integer().named('color')();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}

@DataClassName('TasksTagEntry')
class TasksTagEntries extends Table {
  TextColumn get task => text().references(TasksTable, #id)();
  TextColumn get tag => text().references(TagsTable, #id)();

  @override
  Set<Column<Object>>? get primaryKey => {task, tag};

  Expression<String> get tagsList => tag.groupConcat();
}

@DataClassName('HabitsTagEntry')
class HabitsTagEntries extends Table {
  TextColumn get habit => text().references(HabitsTable, #id)();
  TextColumn get tag => text().references(TagsTable, #id)();

  @override
  Set<Column<Object>>? get primaryKey => {habit, tag};

  Expression<String> get tagsList => tag.groupConcat();
}
