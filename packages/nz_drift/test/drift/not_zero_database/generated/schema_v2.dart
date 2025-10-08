// dart format width=80
// GENERATED CODE, DO NOT EDIT BY HAND.
// ignore_for_file: type=lint
import 'package:drift/drift.dart';

class TasksTable extends Table with TableInfo<TasksTable, TasksTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  TasksTable(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<DateTime> modifiedAt = GeneratedColumn<DateTime>(
    'modified_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
    'completed_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  late final GeneratedColumn<int> importance = GeneratedColumn<int>(
    'importance',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    description,
    createdAt,
    modifiedAt,
    completedAt,
    importance,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tasks_table';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TasksTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TasksTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      modifiedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}modified_at'],
      ),
      completedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}completed_at'],
      ),
      importance: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}importance'],
      )!,
    );
  }

  @override
  TasksTable createAlias(String alias) {
    return TasksTable(attachedDatabase, alias);
  }
}

class TasksTableData extends DataClass implements Insertable<TasksTableData> {
  final String id;
  final String title;
  final String description;
  final DateTime createdAt;
  final DateTime? modifiedAt;
  final DateTime? completedAt;
  final int importance;
  const TasksTableData({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
    this.modifiedAt,
    this.completedAt,
    required this.importance,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || modifiedAt != null) {
      map['modified_at'] = Variable<DateTime>(modifiedAt);
    }
    if (!nullToAbsent || completedAt != null) {
      map['completed_at'] = Variable<DateTime>(completedAt);
    }
    map['importance'] = Variable<int>(importance);
    return map;
  }

  TasksTableCompanion toCompanion(bool nullToAbsent) {
    return TasksTableCompanion(
      id: Value(id),
      title: Value(title),
      description: Value(description),
      createdAt: Value(createdAt),
      modifiedAt: modifiedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(modifiedAt),
      completedAt: completedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(completedAt),
      importance: Value(importance),
    );
  }

  factory TasksTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TasksTableData(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      modifiedAt: serializer.fromJson<DateTime?>(json['modifiedAt']),
      completedAt: serializer.fromJson<DateTime?>(json['completedAt']),
      importance: serializer.fromJson<int>(json['importance']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'modifiedAt': serializer.toJson<DateTime?>(modifiedAt),
      'completedAt': serializer.toJson<DateTime?>(completedAt),
      'importance': serializer.toJson<int>(importance),
    };
  }

  TasksTableData copyWith({
    String? id,
    String? title,
    String? description,
    DateTime? createdAt,
    Value<DateTime?> modifiedAt = const Value.absent(),
    Value<DateTime?> completedAt = const Value.absent(),
    int? importance,
  }) => TasksTableData(
    id: id ?? this.id,
    title: title ?? this.title,
    description: description ?? this.description,
    createdAt: createdAt ?? this.createdAt,
    modifiedAt: modifiedAt.present ? modifiedAt.value : this.modifiedAt,
    completedAt: completedAt.present ? completedAt.value : this.completedAt,
    importance: importance ?? this.importance,
  );
  TasksTableData copyWithCompanion(TasksTableCompanion data) {
    return TasksTableData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description: data.description.present
          ? data.description.value
          : this.description,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      modifiedAt: data.modifiedAt.present
          ? data.modifiedAt.value
          : this.modifiedAt,
      completedAt: data.completedAt.present
          ? data.completedAt.value
          : this.completedAt,
      importance: data.importance.present
          ? data.importance.value
          : this.importance,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TasksTableData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt, ')
          ..write('modifiedAt: $modifiedAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('importance: $importance')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    description,
    createdAt,
    modifiedAt,
    completedAt,
    importance,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TasksTableData &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.createdAt == this.createdAt &&
          other.modifiedAt == this.modifiedAt &&
          other.completedAt == this.completedAt &&
          other.importance == this.importance);
}

class TasksTableCompanion extends UpdateCompanion<TasksTableData> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> description;
  final Value<DateTime> createdAt;
  final Value<DateTime?> modifiedAt;
  final Value<DateTime?> completedAt;
  final Value<int> importance;
  final Value<int> rowid;
  const TasksTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.modifiedAt = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.importance = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TasksTableCompanion.insert({
    required String id,
    required String title,
    required String description,
    required DateTime createdAt,
    this.modifiedAt = const Value.absent(),
    this.completedAt = const Value.absent(),
    required int importance,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title),
       description = Value(description),
       createdAt = Value(createdAt),
       importance = Value(importance);
  static Insertable<TasksTableData> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? modifiedAt,
    Expression<DateTime>? completedAt,
    Expression<int>? importance,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (createdAt != null) 'created_at': createdAt,
      if (modifiedAt != null) 'modified_at': modifiedAt,
      if (completedAt != null) 'completed_at': completedAt,
      if (importance != null) 'importance': importance,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TasksTableCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<String>? description,
    Value<DateTime>? createdAt,
    Value<DateTime?>? modifiedAt,
    Value<DateTime?>? completedAt,
    Value<int>? importance,
    Value<int>? rowid,
  }) {
    return TasksTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      modifiedAt: modifiedAt ?? this.modifiedAt,
      completedAt: completedAt ?? this.completedAt,
      importance: importance ?? this.importance,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (modifiedAt.present) {
      map['modified_at'] = Variable<DateTime>(modifiedAt.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    if (importance.present) {
      map['importance'] = Variable<int>(importance.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TasksTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt, ')
          ..write('modifiedAt: $modifiedAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('importance: $importance, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class DatabaseAtV2 extends GeneratedDatabase {
  DatabaseAtV2(QueryExecutor e) : super(e);
  late final TasksTable tasksTable = TasksTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [tasksTable];
  @override
  int get schemaVersion => 2;
}
