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
import 'package:nz_drift/src/converters/date_converter.dart';
import 'package:nz_drift/src/converters/string_reminder_time_converter.dart';

@UseRowClass(Task, generateInsertable: true)
class TasksTable extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get description => text()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  TextColumn get forDate => text().map(const DateConverter()).nullable()();
  BoolColumn get persistent => boolean().withDefault(const Constant(true))();
  DateTimeColumn get modifiedAt => dateTime().nullable()();
  DateTimeColumn get completedAt => dateTime().nullable()();
  DateTimeColumn get canceledAt => dateTime().nullable()();
  IntColumn get importance => intEnum<TaskImportance>()();
  TextColumn get reminderTime =>
      text().map(const StringReminderTimeConverter()).nullable()();

  @override
  Set<Column<Object>>? get primaryKey => {id};

  Expression<bool> get isCompleted => completedAt.isNotNull();
  Expression<bool> get isNotCompleted => completedAt.isNull();

  Expression<bool> get isPersistent =>
      persistent.equalsExp(const Constant(true));
  Expression<bool> get isNotPersistent =>
      persistent.equalsExp(const Constant(false));

  Expression<bool> get isCanceled => canceledAt.isNotNull();
  Expression<bool> get isNotCanceled => canceledAt.isNull();
}
