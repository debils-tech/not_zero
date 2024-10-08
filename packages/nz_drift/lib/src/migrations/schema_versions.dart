import 'package:drift/internal/versioned_schema.dart' as i0;
import 'package:drift/drift.dart' as i1;
import 'package:drift/drift.dart'; // ignore_for_file: type=lint,unused_import

// GENERATED BY drift_dev, DO NOT MODIFY.
final class Schema2 extends i0.VersionedSchema {
  Schema2({required super.database}) : super(version: 2);
  @override
  late final List<i1.DatabaseSchemaEntity> entities = [
    tasksTable,
  ];
  late final Shape0 tasksTable = Shape0(
      source: i0.VersionedTable(
        entityName: 'tasks_table',
        withoutRowId: false,
        isStrict: false,
        tableConstraints: [
          'PRIMARY KEY(id)',
        ],
        columns: [
          _column_0,
          _column_1,
          _column_2,
          _column_3,
          _column_4,
          _column_5,
          _column_6,
        ],
        attachedDatabase: database,
      ),
      alias: null);
}

class Shape0 extends i0.VersionedTable {
  Shape0({required super.source, required super.alias}) : super.aliased();
  i1.GeneratedColumn<String> get id =>
      columnsByName['id']! as i1.GeneratedColumn<String>;
  i1.GeneratedColumn<String> get title =>
      columnsByName['title']! as i1.GeneratedColumn<String>;
  i1.GeneratedColumn<String> get description =>
      columnsByName['description']! as i1.GeneratedColumn<String>;
  i1.GeneratedColumn<DateTime> get createdAt =>
      columnsByName['created_at']! as i1.GeneratedColumn<DateTime>;
  i1.GeneratedColumn<DateTime> get modifiedAt =>
      columnsByName['modified_at']! as i1.GeneratedColumn<DateTime>;
  i1.GeneratedColumn<DateTime> get completedAt =>
      columnsByName['completed_at']! as i1.GeneratedColumn<DateTime>;
  i1.GeneratedColumn<int> get importance =>
      columnsByName['importance']! as i1.GeneratedColumn<int>;
}

i1.GeneratedColumn<String> _column_0(String aliasedName) =>
    i1.GeneratedColumn<String>('id', aliasedName, false,
        type: i1.DriftSqlType.string);
i1.GeneratedColumn<String> _column_1(String aliasedName) =>
    i1.GeneratedColumn<String>('title', aliasedName, false,
        type: i1.DriftSqlType.string);
i1.GeneratedColumn<String> _column_2(String aliasedName) =>
    i1.GeneratedColumn<String>('description', aliasedName, false,
        type: i1.DriftSqlType.string);
i1.GeneratedColumn<DateTime> _column_3(String aliasedName) =>
    i1.GeneratedColumn<DateTime>('created_at', aliasedName, false,
        type: i1.DriftSqlType.dateTime);
i1.GeneratedColumn<DateTime> _column_4(String aliasedName) =>
    i1.GeneratedColumn<DateTime>('modified_at', aliasedName, true,
        type: i1.DriftSqlType.dateTime);
i1.GeneratedColumn<DateTime> _column_5(String aliasedName) =>
    i1.GeneratedColumn<DateTime>('completed_at', aliasedName, true,
        type: i1.DriftSqlType.dateTime);
i1.GeneratedColumn<int> _column_6(String aliasedName) =>
    i1.GeneratedColumn<int>('importance', aliasedName, false,
        type: i1.DriftSqlType.int);

final class Schema3 extends i0.VersionedSchema {
  Schema3({required super.database}) : super(version: 3);
  @override
  late final List<i1.DatabaseSchemaEntity> entities = [
    tasksTable,
    tagsTable,
    tasksTagEntries,
  ];
  late final Shape0 tasksTable = Shape0(
      source: i0.VersionedTable(
        entityName: 'tasks_table',
        withoutRowId: false,
        isStrict: false,
        tableConstraints: [
          'PRIMARY KEY(id)',
        ],
        columns: [
          _column_0,
          _column_1,
          _column_2,
          _column_3,
          _column_4,
          _column_5,
          _column_6,
        ],
        attachedDatabase: database,
      ),
      alias: null);
  late final Shape1 tagsTable = Shape1(
      source: i0.VersionedTable(
        entityName: 'tags_table',
        withoutRowId: false,
        isStrict: false,
        tableConstraints: [
          'PRIMARY KEY(id)',
        ],
        columns: [
          _column_0,
          _column_7,
          _column_8,
          _column_3,
        ],
        attachedDatabase: database,
      ),
      alias: null);
  late final Shape2 tasksTagEntries = Shape2(
      source: i0.VersionedTable(
        entityName: 'tasks_tag_entries',
        withoutRowId: false,
        isStrict: false,
        tableConstraints: [
          'PRIMARY KEY(task, tag)',
        ],
        columns: [
          _column_9,
          _column_10,
        ],
        attachedDatabase: database,
      ),
      alias: null);
}

class Shape1 extends i0.VersionedTable {
  Shape1({required super.source, required super.alias}) : super.aliased();
  i1.GeneratedColumn<String> get id =>
      columnsByName['id']! as i1.GeneratedColumn<String>;
  i1.GeneratedColumn<String> get name =>
      columnsByName['name']! as i1.GeneratedColumn<String>;
  i1.GeneratedColumn<int> get colorIndex =>
      columnsByName['color']! as i1.GeneratedColumn<int>;
  i1.GeneratedColumn<DateTime> get createdAt =>
      columnsByName['created_at']! as i1.GeneratedColumn<DateTime>;
}

i1.GeneratedColumn<String> _column_7(String aliasedName) =>
    i1.GeneratedColumn<String>('name', aliasedName, false,
        type: i1.DriftSqlType.string);
i1.GeneratedColumn<int> _column_8(String aliasedName) =>
    i1.GeneratedColumn<int>('color', aliasedName, false,
        type: i1.DriftSqlType.int);

class Shape2 extends i0.VersionedTable {
  Shape2({required super.source, required super.alias}) : super.aliased();
  i1.GeneratedColumn<String> get task =>
      columnsByName['task']! as i1.GeneratedColumn<String>;
  i1.GeneratedColumn<String> get tag =>
      columnsByName['tag']! as i1.GeneratedColumn<String>;
}

i1.GeneratedColumn<String> _column_9(String aliasedName) =>
    i1.GeneratedColumn<String>('task', aliasedName, false,
        type: i1.DriftSqlType.string,
        defaultConstraints: i1.GeneratedColumn.constraintIsAlways(
            'REFERENCES tasks_table (id)'));
i1.GeneratedColumn<String> _column_10(String aliasedName) =>
    i1.GeneratedColumn<String>('tag', aliasedName, false,
        type: i1.DriftSqlType.string,
        defaultConstraints: i1.GeneratedColumn.constraintIsAlways(
            'REFERENCES tags_table (id)'));

final class Schema4 extends i0.VersionedSchema {
  Schema4({required super.database}) : super(version: 4);
  @override
  late final List<i1.DatabaseSchemaEntity> entities = [
    tasksTable,
    tagsTable,
    tasksTagEntries,
  ];
  late final Shape3 tasksTable = Shape3(
      source: i0.VersionedTable(
        entityName: 'tasks_table',
        withoutRowId: false,
        isStrict: false,
        tableConstraints: [
          'PRIMARY KEY(id)',
        ],
        columns: [
          _column_0,
          _column_1,
          _column_2,
          _column_3,
          _column_11,
          _column_12,
          _column_4,
          _column_5,
          _column_6,
        ],
        attachedDatabase: database,
      ),
      alias: null);
  late final Shape1 tagsTable = Shape1(
      source: i0.VersionedTable(
        entityName: 'tags_table',
        withoutRowId: false,
        isStrict: false,
        tableConstraints: [
          'PRIMARY KEY(id)',
        ],
        columns: [
          _column_0,
          _column_7,
          _column_8,
          _column_3,
        ],
        attachedDatabase: database,
      ),
      alias: null);
  late final Shape2 tasksTagEntries = Shape2(
      source: i0.VersionedTable(
        entityName: 'tasks_tag_entries',
        withoutRowId: false,
        isStrict: false,
        tableConstraints: [
          'PRIMARY KEY(task, tag)',
        ],
        columns: [
          _column_9,
          _column_10,
        ],
        attachedDatabase: database,
      ),
      alias: null);
}

class Shape3 extends i0.VersionedTable {
  Shape3({required super.source, required super.alias}) : super.aliased();
  i1.GeneratedColumn<String> get id =>
      columnsByName['id']! as i1.GeneratedColumn<String>;
  i1.GeneratedColumn<String> get title =>
      columnsByName['title']! as i1.GeneratedColumn<String>;
  i1.GeneratedColumn<String> get description =>
      columnsByName['description']! as i1.GeneratedColumn<String>;
  i1.GeneratedColumn<DateTime> get createdAt =>
      columnsByName['created_at']! as i1.GeneratedColumn<DateTime>;
  i1.GeneratedColumn<DateTime> get forDate =>
      columnsByName['for_date']! as i1.GeneratedColumn<DateTime>;
  i1.GeneratedColumn<bool> get persistent =>
      columnsByName['persistent']! as i1.GeneratedColumn<bool>;
  i1.GeneratedColumn<DateTime> get modifiedAt =>
      columnsByName['modified_at']! as i1.GeneratedColumn<DateTime>;
  i1.GeneratedColumn<DateTime> get completedAt =>
      columnsByName['completed_at']! as i1.GeneratedColumn<DateTime>;
  i1.GeneratedColumn<int> get importance =>
      columnsByName['importance']! as i1.GeneratedColumn<int>;
}

i1.GeneratedColumn<DateTime> _column_11(String aliasedName) =>
    i1.GeneratedColumn<DateTime>('for_date', aliasedName, false,
        type: i1.DriftSqlType.dateTime);
i1.GeneratedColumn<bool> _column_12(String aliasedName) =>
    i1.GeneratedColumn<bool>('persistent', aliasedName, false,
        type: i1.DriftSqlType.bool,
        defaultConstraints: i1.GeneratedColumn.constraintIsAlways(
            'CHECK ("persistent" IN (0, 1))'));

final class Schema5 extends i0.VersionedSchema {
  Schema5({required super.database}) : super(version: 5);
  @override
  late final List<i1.DatabaseSchemaEntity> entities = [
    tasksTable,
    tagsTable,
    tasksTagEntries,
  ];
  late final Shape4 tasksTable = Shape4(
      source: i0.VersionedTable(
        entityName: 'tasks_table',
        withoutRowId: false,
        isStrict: false,
        tableConstraints: [
          'PRIMARY KEY(id)',
        ],
        columns: [
          _column_0,
          _column_1,
          _column_2,
          _column_3,
          _column_13,
          _column_12,
          _column_4,
          _column_5,
          _column_6,
        ],
        attachedDatabase: database,
      ),
      alias: null);
  late final Shape1 tagsTable = Shape1(
      source: i0.VersionedTable(
        entityName: 'tags_table',
        withoutRowId: false,
        isStrict: false,
        tableConstraints: [
          'PRIMARY KEY(id)',
        ],
        columns: [
          _column_0,
          _column_7,
          _column_8,
          _column_3,
        ],
        attachedDatabase: database,
      ),
      alias: null);
  late final Shape2 tasksTagEntries = Shape2(
      source: i0.VersionedTable(
        entityName: 'tasks_tag_entries',
        withoutRowId: false,
        isStrict: false,
        tableConstraints: [
          'PRIMARY KEY(task, tag)',
        ],
        columns: [
          _column_9,
          _column_10,
        ],
        attachedDatabase: database,
      ),
      alias: null);
}

class Shape4 extends i0.VersionedTable {
  Shape4({required super.source, required super.alias}) : super.aliased();
  i1.GeneratedColumn<String> get id =>
      columnsByName['id']! as i1.GeneratedColumn<String>;
  i1.GeneratedColumn<String> get title =>
      columnsByName['title']! as i1.GeneratedColumn<String>;
  i1.GeneratedColumn<String> get description =>
      columnsByName['description']! as i1.GeneratedColumn<String>;
  i1.GeneratedColumn<DateTime> get createdAt =>
      columnsByName['created_at']! as i1.GeneratedColumn<DateTime>;
  i1.GeneratedColumn<String> get forDate =>
      columnsByName['for_date']! as i1.GeneratedColumn<String>;
  i1.GeneratedColumn<bool> get persistent =>
      columnsByName['persistent']! as i1.GeneratedColumn<bool>;
  i1.GeneratedColumn<DateTime> get modifiedAt =>
      columnsByName['modified_at']! as i1.GeneratedColumn<DateTime>;
  i1.GeneratedColumn<DateTime> get completedAt =>
      columnsByName['completed_at']! as i1.GeneratedColumn<DateTime>;
  i1.GeneratedColumn<int> get importance =>
      columnsByName['importance']! as i1.GeneratedColumn<int>;
}

i1.GeneratedColumn<String> _column_13(String aliasedName) =>
    i1.GeneratedColumn<String>('for_date', aliasedName, false,
        type: i1.DriftSqlType.string);
i0.MigrationStepWithVersion migrationSteps({
  required Future<void> Function(i1.Migrator m, Schema2 schema) from1To2,
  required Future<void> Function(i1.Migrator m, Schema3 schema) from2To3,
  required Future<void> Function(i1.Migrator m, Schema4 schema) from3To4,
  required Future<void> Function(i1.Migrator m, Schema5 schema) from4To5,
}) {
  return (currentVersion, database) async {
    switch (currentVersion) {
      case 1:
        final schema = Schema2(database: database);
        final migrator = i1.Migrator(database, schema);
        await from1To2(migrator, schema);
        return 2;
      case 2:
        final schema = Schema3(database: database);
        final migrator = i1.Migrator(database, schema);
        await from2To3(migrator, schema);
        return 3;
      case 3:
        final schema = Schema4(database: database);
        final migrator = i1.Migrator(database, schema);
        await from3To4(migrator, schema);
        return 4;
      case 4:
        final schema = Schema5(database: database);
        final migrator = i1.Migrator(database, schema);
        await from4To5(migrator, schema);
        return 5;
      default:
        throw ArgumentError.value('Unknown migration from $currentVersion');
    }
  };
}

i1.OnUpgrade stepByStep({
  required Future<void> Function(i1.Migrator m, Schema2 schema) from1To2,
  required Future<void> Function(i1.Migrator m, Schema3 schema) from2To3,
  required Future<void> Function(i1.Migrator m, Schema4 schema) from3To4,
  required Future<void> Function(i1.Migrator m, Schema5 schema) from4To5,
}) =>
    i0.VersionedSchema.stepByStepHelper(
        step: migrationSteps(
      from1To2: from1To2,
      from2To3: from2To3,
      from3To4: from3To4,
      from4To5: from4To5,
    ));
