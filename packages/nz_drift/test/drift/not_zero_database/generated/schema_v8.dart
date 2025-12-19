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
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints:
        'NOT NULL DEFAULT (CAST(strftime(\'%s\', CURRENT_TIMESTAMP) AS INTEGER))',
    defaultValue: const CustomExpression(
      'CAST(strftime(\'%s\', CURRENT_TIMESTAMP) AS INTEGER)',
    ),
  );
  late final GeneratedColumn<String> forDate = GeneratedColumn<String>(
    'for_date',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NULL',
  );
  late final GeneratedColumn<int> persistent = GeneratedColumn<int>(
    'persistent',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT 1 CHECK (persistent IN (0, 1))',
    defaultValue: const CustomExpression('1'),
  );
  late final GeneratedColumn<int> modifiedAt = GeneratedColumn<int>(
    'modified_at',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NULL',
  );
  late final GeneratedColumn<int> completedAt = GeneratedColumn<int>(
    'completed_at',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NULL',
  );
  late final GeneratedColumn<int> canceledAt = GeneratedColumn<int>(
    'canceled_at',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NULL',
  );
  late final GeneratedColumn<int> importance = GeneratedColumn<int>(
    'importance',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    description,
    createdAt,
    forDate,
    persistent,
    modifiedAt,
    completedAt,
    canceledAt,
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
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      forDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}for_date'],
      ),
      persistent: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}persistent'],
      )!,
      modifiedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}modified_at'],
      ),
      completedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}completed_at'],
      ),
      canceledAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}canceled_at'],
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

  @override
  List<String> get customConstraints => const ['PRIMARY KEY(id)'];
  @override
  bool get dontWriteConstraints => true;
}

class TasksTableData extends DataClass implements Insertable<TasksTableData> {
  final String id;
  final String title;
  final String description;
  final int createdAt;
  final String? forDate;
  final int persistent;
  final int? modifiedAt;
  final int? completedAt;
  final int? canceledAt;
  final int importance;
  const TasksTableData({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
    this.forDate,
    required this.persistent,
    this.modifiedAt,
    this.completedAt,
    this.canceledAt,
    required this.importance,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['created_at'] = Variable<int>(createdAt);
    if (!nullToAbsent || forDate != null) {
      map['for_date'] = Variable<String>(forDate);
    }
    map['persistent'] = Variable<int>(persistent);
    if (!nullToAbsent || modifiedAt != null) {
      map['modified_at'] = Variable<int>(modifiedAt);
    }
    if (!nullToAbsent || completedAt != null) {
      map['completed_at'] = Variable<int>(completedAt);
    }
    if (!nullToAbsent || canceledAt != null) {
      map['canceled_at'] = Variable<int>(canceledAt);
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
      forDate: forDate == null && nullToAbsent
          ? const Value.absent()
          : Value(forDate),
      persistent: Value(persistent),
      modifiedAt: modifiedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(modifiedAt),
      completedAt: completedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(completedAt),
      canceledAt: canceledAt == null && nullToAbsent
          ? const Value.absent()
          : Value(canceledAt),
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
      createdAt: serializer.fromJson<int>(json['createdAt']),
      forDate: serializer.fromJson<String?>(json['forDate']),
      persistent: serializer.fromJson<int>(json['persistent']),
      modifiedAt: serializer.fromJson<int?>(json['modifiedAt']),
      completedAt: serializer.fromJson<int?>(json['completedAt']),
      canceledAt: serializer.fromJson<int?>(json['canceledAt']),
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
      'createdAt': serializer.toJson<int>(createdAt),
      'forDate': serializer.toJson<String?>(forDate),
      'persistent': serializer.toJson<int>(persistent),
      'modifiedAt': serializer.toJson<int?>(modifiedAt),
      'completedAt': serializer.toJson<int?>(completedAt),
      'canceledAt': serializer.toJson<int?>(canceledAt),
      'importance': serializer.toJson<int>(importance),
    };
  }

  TasksTableData copyWith({
    String? id,
    String? title,
    String? description,
    int? createdAt,
    Value<String?> forDate = const Value.absent(),
    int? persistent,
    Value<int?> modifiedAt = const Value.absent(),
    Value<int?> completedAt = const Value.absent(),
    Value<int?> canceledAt = const Value.absent(),
    int? importance,
  }) => TasksTableData(
    id: id ?? this.id,
    title: title ?? this.title,
    description: description ?? this.description,
    createdAt: createdAt ?? this.createdAt,
    forDate: forDate.present ? forDate.value : this.forDate,
    persistent: persistent ?? this.persistent,
    modifiedAt: modifiedAt.present ? modifiedAt.value : this.modifiedAt,
    completedAt: completedAt.present ? completedAt.value : this.completedAt,
    canceledAt: canceledAt.present ? canceledAt.value : this.canceledAt,
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
      forDate: data.forDate.present ? data.forDate.value : this.forDate,
      persistent: data.persistent.present
          ? data.persistent.value
          : this.persistent,
      modifiedAt: data.modifiedAt.present
          ? data.modifiedAt.value
          : this.modifiedAt,
      completedAt: data.completedAt.present
          ? data.completedAt.value
          : this.completedAt,
      canceledAt: data.canceledAt.present
          ? data.canceledAt.value
          : this.canceledAt,
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
          ..write('forDate: $forDate, ')
          ..write('persistent: $persistent, ')
          ..write('modifiedAt: $modifiedAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('canceledAt: $canceledAt, ')
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
    forDate,
    persistent,
    modifiedAt,
    completedAt,
    canceledAt,
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
          other.forDate == this.forDate &&
          other.persistent == this.persistent &&
          other.modifiedAt == this.modifiedAt &&
          other.completedAt == this.completedAt &&
          other.canceledAt == this.canceledAt &&
          other.importance == this.importance);
}

class TasksTableCompanion extends UpdateCompanion<TasksTableData> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> description;
  final Value<int> createdAt;
  final Value<String?> forDate;
  final Value<int> persistent;
  final Value<int?> modifiedAt;
  final Value<int?> completedAt;
  final Value<int?> canceledAt;
  final Value<int> importance;
  final Value<int> rowid;
  const TasksTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.forDate = const Value.absent(),
    this.persistent = const Value.absent(),
    this.modifiedAt = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.canceledAt = const Value.absent(),
    this.importance = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TasksTableCompanion.insert({
    required String id,
    required String title,
    required String description,
    this.createdAt = const Value.absent(),
    this.forDate = const Value.absent(),
    this.persistent = const Value.absent(),
    this.modifiedAt = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.canceledAt = const Value.absent(),
    required int importance,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title),
       description = Value(description),
       importance = Value(importance);
  static Insertable<TasksTableData> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<int>? createdAt,
    Expression<String>? forDate,
    Expression<int>? persistent,
    Expression<int>? modifiedAt,
    Expression<int>? completedAt,
    Expression<int>? canceledAt,
    Expression<int>? importance,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (createdAt != null) 'created_at': createdAt,
      if (forDate != null) 'for_date': forDate,
      if (persistent != null) 'persistent': persistent,
      if (modifiedAt != null) 'modified_at': modifiedAt,
      if (completedAt != null) 'completed_at': completedAt,
      if (canceledAt != null) 'canceled_at': canceledAt,
      if (importance != null) 'importance': importance,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TasksTableCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<String>? description,
    Value<int>? createdAt,
    Value<String?>? forDate,
    Value<int>? persistent,
    Value<int?>? modifiedAt,
    Value<int?>? completedAt,
    Value<int?>? canceledAt,
    Value<int>? importance,
    Value<int>? rowid,
  }) {
    return TasksTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      forDate: forDate ?? this.forDate,
      persistent: persistent ?? this.persistent,
      modifiedAt: modifiedAt ?? this.modifiedAt,
      completedAt: completedAt ?? this.completedAt,
      canceledAt: canceledAt ?? this.canceledAt,
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
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (forDate.present) {
      map['for_date'] = Variable<String>(forDate.value);
    }
    if (persistent.present) {
      map['persistent'] = Variable<int>(persistent.value);
    }
    if (modifiedAt.present) {
      map['modified_at'] = Variable<int>(modifiedAt.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<int>(completedAt.value);
    }
    if (canceledAt.present) {
      map['canceled_at'] = Variable<int>(canceledAt.value);
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
          ..write('forDate: $forDate, ')
          ..write('persistent: $persistent, ')
          ..write('modifiedAt: $modifiedAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('canceledAt: $canceledAt, ')
          ..write('importance: $importance, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class TagsTable extends Table with TableInfo<TagsTable, TagsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  TagsTable(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<int> color = GeneratedColumn<int>(
    'color',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints:
        'NOT NULL DEFAULT (CAST(strftime(\'%s\', CURRENT_TIMESTAMP) AS INTEGER))',
    defaultValue: const CustomExpression(
      'CAST(strftime(\'%s\', CURRENT_TIMESTAMP) AS INTEGER)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, color, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tags_table';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TagsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TagsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      color: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}color'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  TagsTable createAlias(String alias) {
    return TagsTable(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const ['PRIMARY KEY(id)'];
  @override
  bool get dontWriteConstraints => true;
}

class TagsTableData extends DataClass implements Insertable<TagsTableData> {
  final String id;
  final String name;
  final int color;
  final int createdAt;
  const TagsTableData({
    required this.id,
    required this.name,
    required this.color,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['color'] = Variable<int>(color);
    map['created_at'] = Variable<int>(createdAt);
    return map;
  }

  TagsTableCompanion toCompanion(bool nullToAbsent) {
    return TagsTableCompanion(
      id: Value(id),
      name: Value(name),
      color: Value(color),
      createdAt: Value(createdAt),
    );
  }

  factory TagsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TagsTableData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      color: serializer.fromJson<int>(json['color']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'color': serializer.toJson<int>(color),
      'createdAt': serializer.toJson<int>(createdAt),
    };
  }

  TagsTableData copyWith({
    String? id,
    String? name,
    int? color,
    int? createdAt,
  }) => TagsTableData(
    id: id ?? this.id,
    name: name ?? this.name,
    color: color ?? this.color,
    createdAt: createdAt ?? this.createdAt,
  );
  TagsTableData copyWithCompanion(TagsTableCompanion data) {
    return TagsTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      color: data.color.present ? data.color.value : this.color,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TagsTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('color: $color, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, color, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TagsTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.color == this.color &&
          other.createdAt == this.createdAt);
}

class TagsTableCompanion extends UpdateCompanion<TagsTableData> {
  final Value<String> id;
  final Value<String> name;
  final Value<int> color;
  final Value<int> createdAt;
  final Value<int> rowid;
  const TagsTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.color = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TagsTableCompanion.insert({
    required String id,
    required String name,
    required int color,
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       color = Value(color);
  static Insertable<TagsTableData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<int>? color,
    Expression<int>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (color != null) 'color': color,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TagsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<int>? color,
    Value<int>? createdAt,
    Value<int>? rowid,
  }) {
    return TagsTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (color.present) {
      map['color'] = Variable<int>(color.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TagsTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('color: $color, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class TasksTagEntries extends Table
    with TableInfo<TasksTagEntries, TasksTagEntriesData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  TasksTagEntries(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> task = GeneratedColumn<String>(
    'task',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL REFERENCES tasks_table(id)',
  );
  late final GeneratedColumn<String> tag = GeneratedColumn<String>(
    'tag',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL REFERENCES tags_table(id)',
  );
  @override
  List<GeneratedColumn> get $columns => [task, tag];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tasks_tag_entries';
  @override
  Set<GeneratedColumn> get $primaryKey => {task, tag};
  @override
  TasksTagEntriesData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TasksTagEntriesData(
      task: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}task'],
      )!,
      tag: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tag'],
      )!,
    );
  }

  @override
  TasksTagEntries createAlias(String alias) {
    return TasksTagEntries(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const ['PRIMARY KEY(task, tag)'];
  @override
  bool get dontWriteConstraints => true;
}

class TasksTagEntriesData extends DataClass
    implements Insertable<TasksTagEntriesData> {
  final String task;
  final String tag;
  const TasksTagEntriesData({required this.task, required this.tag});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['task'] = Variable<String>(task);
    map['tag'] = Variable<String>(tag);
    return map;
  }

  TasksTagEntriesCompanion toCompanion(bool nullToAbsent) {
    return TasksTagEntriesCompanion(task: Value(task), tag: Value(tag));
  }

  factory TasksTagEntriesData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TasksTagEntriesData(
      task: serializer.fromJson<String>(json['task']),
      tag: serializer.fromJson<String>(json['tag']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'task': serializer.toJson<String>(task),
      'tag': serializer.toJson<String>(tag),
    };
  }

  TasksTagEntriesData copyWith({String? task, String? tag}) =>
      TasksTagEntriesData(task: task ?? this.task, tag: tag ?? this.tag);
  TasksTagEntriesData copyWithCompanion(TasksTagEntriesCompanion data) {
    return TasksTagEntriesData(
      task: data.task.present ? data.task.value : this.task,
      tag: data.tag.present ? data.tag.value : this.tag,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TasksTagEntriesData(')
          ..write('task: $task, ')
          ..write('tag: $tag')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(task, tag);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TasksTagEntriesData &&
          other.task == this.task &&
          other.tag == this.tag);
}

class TasksTagEntriesCompanion extends UpdateCompanion<TasksTagEntriesData> {
  final Value<String> task;
  final Value<String> tag;
  final Value<int> rowid;
  const TasksTagEntriesCompanion({
    this.task = const Value.absent(),
    this.tag = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TasksTagEntriesCompanion.insert({
    required String task,
    required String tag,
    this.rowid = const Value.absent(),
  }) : task = Value(task),
       tag = Value(tag);
  static Insertable<TasksTagEntriesData> custom({
    Expression<String>? task,
    Expression<String>? tag,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (task != null) 'task': task,
      if (tag != null) 'tag': tag,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TasksTagEntriesCompanion copyWith({
    Value<String>? task,
    Value<String>? tag,
    Value<int>? rowid,
  }) {
    return TasksTagEntriesCompanion(
      task: task ?? this.task,
      tag: tag ?? this.tag,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (task.present) {
      map['task'] = Variable<String>(task.value);
    }
    if (tag.present) {
      map['tag'] = Variable<String>(tag.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TasksTagEntriesCompanion(')
          ..write('task: $task, ')
          ..write('tag: $tag, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class HabitsTable extends Table with TableInfo<HabitsTable, HabitsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  HabitsTable(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT \'\'',
    defaultValue: const CustomExpression('\'\''),
  );
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints:
        'NOT NULL DEFAULT (CAST(strftime(\'%s\', CURRENT_TIMESTAMP) AS INTEGER))',
    defaultValue: const CustomExpression(
      'CAST(strftime(\'%s\', CURRENT_TIMESTAMP) AS INTEGER)',
    ),
  );
  late final GeneratedColumn<int> modifiedAt = GeneratedColumn<int>(
    'modified_at',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NULL',
  );
  late final GeneratedColumn<int> importance = GeneratedColumn<int>(
    'importance',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    description,
    createdAt,
    modifiedAt,
    importance,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'habits_table';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HabitsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HabitsTableData(
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
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      modifiedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}modified_at'],
      ),
      importance: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}importance'],
      )!,
    );
  }

  @override
  HabitsTable createAlias(String alias) {
    return HabitsTable(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const ['PRIMARY KEY(id)'];
  @override
  bool get dontWriteConstraints => true;
}

class HabitsTableData extends DataClass implements Insertable<HabitsTableData> {
  final String id;
  final String title;
  final String description;
  final int createdAt;
  final int? modifiedAt;
  final int importance;
  const HabitsTableData({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
    this.modifiedAt,
    required this.importance,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['created_at'] = Variable<int>(createdAt);
    if (!nullToAbsent || modifiedAt != null) {
      map['modified_at'] = Variable<int>(modifiedAt);
    }
    map['importance'] = Variable<int>(importance);
    return map;
  }

  HabitsTableCompanion toCompanion(bool nullToAbsent) {
    return HabitsTableCompanion(
      id: Value(id),
      title: Value(title),
      description: Value(description),
      createdAt: Value(createdAt),
      modifiedAt: modifiedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(modifiedAt),
      importance: Value(importance),
    );
  }

  factory HabitsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HabitsTableData(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      modifiedAt: serializer.fromJson<int?>(json['modifiedAt']),
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
      'createdAt': serializer.toJson<int>(createdAt),
      'modifiedAt': serializer.toJson<int?>(modifiedAt),
      'importance': serializer.toJson<int>(importance),
    };
  }

  HabitsTableData copyWith({
    String? id,
    String? title,
    String? description,
    int? createdAt,
    Value<int?> modifiedAt = const Value.absent(),
    int? importance,
  }) => HabitsTableData(
    id: id ?? this.id,
    title: title ?? this.title,
    description: description ?? this.description,
    createdAt: createdAt ?? this.createdAt,
    modifiedAt: modifiedAt.present ? modifiedAt.value : this.modifiedAt,
    importance: importance ?? this.importance,
  );
  HabitsTableData copyWithCompanion(HabitsTableCompanion data) {
    return HabitsTableData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description: data.description.present
          ? data.description.value
          : this.description,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      modifiedAt: data.modifiedAt.present
          ? data.modifiedAt.value
          : this.modifiedAt,
      importance: data.importance.present
          ? data.importance.value
          : this.importance,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HabitsTableData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt, ')
          ..write('modifiedAt: $modifiedAt, ')
          ..write('importance: $importance')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, title, description, createdAt, modifiedAt, importance);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HabitsTableData &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.createdAt == this.createdAt &&
          other.modifiedAt == this.modifiedAt &&
          other.importance == this.importance);
}

class HabitsTableCompanion extends UpdateCompanion<HabitsTableData> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> description;
  final Value<int> createdAt;
  final Value<int?> modifiedAt;
  final Value<int> importance;
  final Value<int> rowid;
  const HabitsTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.modifiedAt = const Value.absent(),
    this.importance = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  HabitsTableCompanion.insert({
    required String id,
    required String title,
    this.description = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.modifiedAt = const Value.absent(),
    required int importance,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title),
       importance = Value(importance);
  static Insertable<HabitsTableData> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<int>? createdAt,
    Expression<int>? modifiedAt,
    Expression<int>? importance,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (createdAt != null) 'created_at': createdAt,
      if (modifiedAt != null) 'modified_at': modifiedAt,
      if (importance != null) 'importance': importance,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HabitsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<String>? description,
    Value<int>? createdAt,
    Value<int?>? modifiedAt,
    Value<int>? importance,
    Value<int>? rowid,
  }) {
    return HabitsTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      modifiedAt: modifiedAt ?? this.modifiedAt,
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
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (modifiedAt.present) {
      map['modified_at'] = Variable<int>(modifiedAt.value);
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
    return (StringBuffer('HabitsTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt, ')
          ..write('modifiedAt: $modifiedAt, ')
          ..write('importance: $importance, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class HabitCompletionsTable extends Table
    with TableInfo<HabitCompletionsTable, HabitCompletionsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  HabitCompletionsTable(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> habitId = GeneratedColumn<String>(
    'habit_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL REFERENCES habits_table(id)',
  );
  late final GeneratedColumn<int> type = GeneratedColumn<int>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> completedDate = GeneratedColumn<String>(
    'completed_date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<int> streakCount = GeneratedColumn<int>(
    'streak_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT 1',
    defaultValue: const CustomExpression('1'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    habitId,
    type,
    completedDate,
    streakCount,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'habit_completions_table';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {habitId, completedDate},
  ];
  @override
  HabitCompletionsTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HabitCompletionsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      habitId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}habit_id'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}type'],
      )!,
      completedDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}completed_date'],
      )!,
      streakCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}streak_count'],
      )!,
    );
  }

  @override
  HabitCompletionsTable createAlias(String alias) {
    return HabitCompletionsTable(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
    'PRIMARY KEY(id)',
    'UNIQUE(habit_id, completed_date)',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class HabitCompletionsTableData extends DataClass
    implements Insertable<HabitCompletionsTableData> {
  final String id;
  final String habitId;
  final int type;
  final String completedDate;
  final int streakCount;
  const HabitCompletionsTableData({
    required this.id,
    required this.habitId,
    required this.type,
    required this.completedDate,
    required this.streakCount,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['habit_id'] = Variable<String>(habitId);
    map['type'] = Variable<int>(type);
    map['completed_date'] = Variable<String>(completedDate);
    map['streak_count'] = Variable<int>(streakCount);
    return map;
  }

  HabitCompletionsTableCompanion toCompanion(bool nullToAbsent) {
    return HabitCompletionsTableCompanion(
      id: Value(id),
      habitId: Value(habitId),
      type: Value(type),
      completedDate: Value(completedDate),
      streakCount: Value(streakCount),
    );
  }

  factory HabitCompletionsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HabitCompletionsTableData(
      id: serializer.fromJson<String>(json['id']),
      habitId: serializer.fromJson<String>(json['habitId']),
      type: serializer.fromJson<int>(json['type']),
      completedDate: serializer.fromJson<String>(json['completedDate']),
      streakCount: serializer.fromJson<int>(json['streakCount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'habitId': serializer.toJson<String>(habitId),
      'type': serializer.toJson<int>(type),
      'completedDate': serializer.toJson<String>(completedDate),
      'streakCount': serializer.toJson<int>(streakCount),
    };
  }

  HabitCompletionsTableData copyWith({
    String? id,
    String? habitId,
    int? type,
    String? completedDate,
    int? streakCount,
  }) => HabitCompletionsTableData(
    id: id ?? this.id,
    habitId: habitId ?? this.habitId,
    type: type ?? this.type,
    completedDate: completedDate ?? this.completedDate,
    streakCount: streakCount ?? this.streakCount,
  );
  HabitCompletionsTableData copyWithCompanion(
    HabitCompletionsTableCompanion data,
  ) {
    return HabitCompletionsTableData(
      id: data.id.present ? data.id.value : this.id,
      habitId: data.habitId.present ? data.habitId.value : this.habitId,
      type: data.type.present ? data.type.value : this.type,
      completedDate: data.completedDate.present
          ? data.completedDate.value
          : this.completedDate,
      streakCount: data.streakCount.present
          ? data.streakCount.value
          : this.streakCount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HabitCompletionsTableData(')
          ..write('id: $id, ')
          ..write('habitId: $habitId, ')
          ..write('type: $type, ')
          ..write('completedDate: $completedDate, ')
          ..write('streakCount: $streakCount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, habitId, type, completedDate, streakCount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HabitCompletionsTableData &&
          other.id == this.id &&
          other.habitId == this.habitId &&
          other.type == this.type &&
          other.completedDate == this.completedDate &&
          other.streakCount == this.streakCount);
}

class HabitCompletionsTableCompanion
    extends UpdateCompanion<HabitCompletionsTableData> {
  final Value<String> id;
  final Value<String> habitId;
  final Value<int> type;
  final Value<String> completedDate;
  final Value<int> streakCount;
  final Value<int> rowid;
  const HabitCompletionsTableCompanion({
    this.id = const Value.absent(),
    this.habitId = const Value.absent(),
    this.type = const Value.absent(),
    this.completedDate = const Value.absent(),
    this.streakCount = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  HabitCompletionsTableCompanion.insert({
    required String id,
    required String habitId,
    required int type,
    required String completedDate,
    this.streakCount = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       habitId = Value(habitId),
       type = Value(type),
       completedDate = Value(completedDate);
  static Insertable<HabitCompletionsTableData> custom({
    Expression<String>? id,
    Expression<String>? habitId,
    Expression<int>? type,
    Expression<String>? completedDate,
    Expression<int>? streakCount,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (habitId != null) 'habit_id': habitId,
      if (type != null) 'type': type,
      if (completedDate != null) 'completed_date': completedDate,
      if (streakCount != null) 'streak_count': streakCount,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HabitCompletionsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? habitId,
    Value<int>? type,
    Value<String>? completedDate,
    Value<int>? streakCount,
    Value<int>? rowid,
  }) {
    return HabitCompletionsTableCompanion(
      id: id ?? this.id,
      habitId: habitId ?? this.habitId,
      type: type ?? this.type,
      completedDate: completedDate ?? this.completedDate,
      streakCount: streakCount ?? this.streakCount,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (habitId.present) {
      map['habit_id'] = Variable<String>(habitId.value);
    }
    if (type.present) {
      map['type'] = Variable<int>(type.value);
    }
    if (completedDate.present) {
      map['completed_date'] = Variable<String>(completedDate.value);
    }
    if (streakCount.present) {
      map['streak_count'] = Variable<int>(streakCount.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HabitCompletionsTableCompanion(')
          ..write('id: $id, ')
          ..write('habitId: $habitId, ')
          ..write('type: $type, ')
          ..write('completedDate: $completedDate, ')
          ..write('streakCount: $streakCount, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class HabitsTagEntries extends Table
    with TableInfo<HabitsTagEntries, HabitsTagEntriesData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  HabitsTagEntries(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> habit = GeneratedColumn<String>(
    'habit',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL REFERENCES habits_table(id)',
  );
  late final GeneratedColumn<String> tag = GeneratedColumn<String>(
    'tag',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL REFERENCES tags_table(id)',
  );
  @override
  List<GeneratedColumn> get $columns => [habit, tag];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'habits_tag_entries';
  @override
  Set<GeneratedColumn> get $primaryKey => {habit, tag};
  @override
  HabitsTagEntriesData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HabitsTagEntriesData(
      habit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}habit'],
      )!,
      tag: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tag'],
      )!,
    );
  }

  @override
  HabitsTagEntries createAlias(String alias) {
    return HabitsTagEntries(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const ['PRIMARY KEY(habit, tag)'];
  @override
  bool get dontWriteConstraints => true;
}

class HabitsTagEntriesData extends DataClass
    implements Insertable<HabitsTagEntriesData> {
  final String habit;
  final String tag;
  const HabitsTagEntriesData({required this.habit, required this.tag});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['habit'] = Variable<String>(habit);
    map['tag'] = Variable<String>(tag);
    return map;
  }

  HabitsTagEntriesCompanion toCompanion(bool nullToAbsent) {
    return HabitsTagEntriesCompanion(habit: Value(habit), tag: Value(tag));
  }

  factory HabitsTagEntriesData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HabitsTagEntriesData(
      habit: serializer.fromJson<String>(json['habit']),
      tag: serializer.fromJson<String>(json['tag']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'habit': serializer.toJson<String>(habit),
      'tag': serializer.toJson<String>(tag),
    };
  }

  HabitsTagEntriesData copyWith({String? habit, String? tag}) =>
      HabitsTagEntriesData(habit: habit ?? this.habit, tag: tag ?? this.tag);
  HabitsTagEntriesData copyWithCompanion(HabitsTagEntriesCompanion data) {
    return HabitsTagEntriesData(
      habit: data.habit.present ? data.habit.value : this.habit,
      tag: data.tag.present ? data.tag.value : this.tag,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HabitsTagEntriesData(')
          ..write('habit: $habit, ')
          ..write('tag: $tag')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(habit, tag);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HabitsTagEntriesData &&
          other.habit == this.habit &&
          other.tag == this.tag);
}

class HabitsTagEntriesCompanion extends UpdateCompanion<HabitsTagEntriesData> {
  final Value<String> habit;
  final Value<String> tag;
  final Value<int> rowid;
  const HabitsTagEntriesCompanion({
    this.habit = const Value.absent(),
    this.tag = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  HabitsTagEntriesCompanion.insert({
    required String habit,
    required String tag,
    this.rowid = const Value.absent(),
  }) : habit = Value(habit),
       tag = Value(tag);
  static Insertable<HabitsTagEntriesData> custom({
    Expression<String>? habit,
    Expression<String>? tag,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (habit != null) 'habit': habit,
      if (tag != null) 'tag': tag,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HabitsTagEntriesCompanion copyWith({
    Value<String>? habit,
    Value<String>? tag,
    Value<int>? rowid,
  }) {
    return HabitsTagEntriesCompanion(
      habit: habit ?? this.habit,
      tag: tag ?? this.tag,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (habit.present) {
      map['habit'] = Variable<String>(habit.value);
    }
    if (tag.present) {
      map['tag'] = Variable<String>(tag.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HabitsTagEntriesCompanion(')
          ..write('habit: $habit, ')
          ..write('tag: $tag, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class CheckInTable extends Table
    with TableInfo<CheckInTable, CheckInTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  CheckInTable(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> checkInDate = GeneratedColumn<String>(
    'check_in_date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL UNIQUE',
  );
  late final GeneratedColumn<int> streakCount = GeneratedColumn<int>(
    'streak_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT 1',
    defaultValue: const CustomExpression('1'),
  );
  @override
  List<GeneratedColumn> get $columns => [id, checkInDate, streakCount];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'check_in_table';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CheckInTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CheckInTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      checkInDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}check_in_date'],
      )!,
      streakCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}streak_count'],
      )!,
    );
  }

  @override
  CheckInTable createAlias(String alias) {
    return CheckInTable(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const ['PRIMARY KEY(id)'];
  @override
  bool get dontWriteConstraints => true;
}

class CheckInTableData extends DataClass
    implements Insertable<CheckInTableData> {
  final String id;
  final String checkInDate;
  final int streakCount;
  const CheckInTableData({
    required this.id,
    required this.checkInDate,
    required this.streakCount,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['check_in_date'] = Variable<String>(checkInDate);
    map['streak_count'] = Variable<int>(streakCount);
    return map;
  }

  CheckInTableCompanion toCompanion(bool nullToAbsent) {
    return CheckInTableCompanion(
      id: Value(id),
      checkInDate: Value(checkInDate),
      streakCount: Value(streakCount),
    );
  }

  factory CheckInTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CheckInTableData(
      id: serializer.fromJson<String>(json['id']),
      checkInDate: serializer.fromJson<String>(json['checkInDate']),
      streakCount: serializer.fromJson<int>(json['streakCount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'checkInDate': serializer.toJson<String>(checkInDate),
      'streakCount': serializer.toJson<int>(streakCount),
    };
  }

  CheckInTableData copyWith({
    String? id,
    String? checkInDate,
    int? streakCount,
  }) => CheckInTableData(
    id: id ?? this.id,
    checkInDate: checkInDate ?? this.checkInDate,
    streakCount: streakCount ?? this.streakCount,
  );
  CheckInTableData copyWithCompanion(CheckInTableCompanion data) {
    return CheckInTableData(
      id: data.id.present ? data.id.value : this.id,
      checkInDate: data.checkInDate.present
          ? data.checkInDate.value
          : this.checkInDate,
      streakCount: data.streakCount.present
          ? data.streakCount.value
          : this.streakCount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CheckInTableData(')
          ..write('id: $id, ')
          ..write('checkInDate: $checkInDate, ')
          ..write('streakCount: $streakCount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, checkInDate, streakCount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CheckInTableData &&
          other.id == this.id &&
          other.checkInDate == this.checkInDate &&
          other.streakCount == this.streakCount);
}

class CheckInTableCompanion extends UpdateCompanion<CheckInTableData> {
  final Value<String> id;
  final Value<String> checkInDate;
  final Value<int> streakCount;
  final Value<int> rowid;
  const CheckInTableCompanion({
    this.id = const Value.absent(),
    this.checkInDate = const Value.absent(),
    this.streakCount = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CheckInTableCompanion.insert({
    required String id,
    required String checkInDate,
    this.streakCount = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       checkInDate = Value(checkInDate);
  static Insertable<CheckInTableData> custom({
    Expression<String>? id,
    Expression<String>? checkInDate,
    Expression<int>? streakCount,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (checkInDate != null) 'check_in_date': checkInDate,
      if (streakCount != null) 'streak_count': streakCount,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CheckInTableCompanion copyWith({
    Value<String>? id,
    Value<String>? checkInDate,
    Value<int>? streakCount,
    Value<int>? rowid,
  }) {
    return CheckInTableCompanion(
      id: id ?? this.id,
      checkInDate: checkInDate ?? this.checkInDate,
      streakCount: streakCount ?? this.streakCount,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (checkInDate.present) {
      map['check_in_date'] = Variable<String>(checkInDate.value);
    }
    if (streakCount.present) {
      map['streak_count'] = Variable<int>(streakCount.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CheckInTableCompanion(')
          ..write('id: $id, ')
          ..write('checkInDate: $checkInDate, ')
          ..write('streakCount: $streakCount, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class DatabaseAtV8 extends GeneratedDatabase {
  DatabaseAtV8(QueryExecutor e) : super(e);
  late final TasksTable tasksTable = TasksTable(this);
  late final TagsTable tagsTable = TagsTable(this);
  late final TasksTagEntries tasksTagEntries = TasksTagEntries(this);
  late final HabitsTable habitsTable = HabitsTable(this);
  late final HabitCompletionsTable habitCompletionsTable =
      HabitCompletionsTable(this);
  late final HabitsTagEntries habitsTagEntries = HabitsTagEntries(this);
  late final CheckInTable checkInTable = CheckInTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    tasksTable,
    tagsTable,
    tasksTagEntries,
    habitsTable,
    habitCompletionsTable,
    habitsTagEntries,
    checkInTable,
  ];
  @override
  int get schemaVersion => 8;
}
