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
    requiredDuringInsert: false,
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
  );
  late final GeneratedColumn<bool> persistent = GeneratedColumn<bool>(
    'persistent',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("persistent" IN (0, 1))',
    ),
    defaultValue: const CustomExpression('1'),
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
  late final GeneratedColumn<DateTime> canceledAt = GeneratedColumn<DateTime>(
    'canceled_at',
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
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      forDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}for_date'],
      ),
      persistent: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}persistent'],
      )!,
      modifiedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}modified_at'],
      ),
      completedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}completed_at'],
      ),
      canceledAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
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
}

class TasksTableData extends DataClass implements Insertable<TasksTableData> {
  final String id;
  final String title;
  final String description;
  final DateTime createdAt;
  final String? forDate;
  final bool persistent;
  final DateTime? modifiedAt;
  final DateTime? completedAt;
  final DateTime? canceledAt;
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
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || forDate != null) {
      map['for_date'] = Variable<String>(forDate);
    }
    map['persistent'] = Variable<bool>(persistent);
    if (!nullToAbsent || modifiedAt != null) {
      map['modified_at'] = Variable<DateTime>(modifiedAt);
    }
    if (!nullToAbsent || completedAt != null) {
      map['completed_at'] = Variable<DateTime>(completedAt);
    }
    if (!nullToAbsent || canceledAt != null) {
      map['canceled_at'] = Variable<DateTime>(canceledAt);
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
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      forDate: serializer.fromJson<String?>(json['forDate']),
      persistent: serializer.fromJson<bool>(json['persistent']),
      modifiedAt: serializer.fromJson<DateTime?>(json['modifiedAt']),
      completedAt: serializer.fromJson<DateTime?>(json['completedAt']),
      canceledAt: serializer.fromJson<DateTime?>(json['canceledAt']),
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
      'forDate': serializer.toJson<String?>(forDate),
      'persistent': serializer.toJson<bool>(persistent),
      'modifiedAt': serializer.toJson<DateTime?>(modifiedAt),
      'completedAt': serializer.toJson<DateTime?>(completedAt),
      'canceledAt': serializer.toJson<DateTime?>(canceledAt),
      'importance': serializer.toJson<int>(importance),
    };
  }

  TasksTableData copyWith({
    String? id,
    String? title,
    String? description,
    DateTime? createdAt,
    Value<String?> forDate = const Value.absent(),
    bool? persistent,
    Value<DateTime?> modifiedAt = const Value.absent(),
    Value<DateTime?> completedAt = const Value.absent(),
    Value<DateTime?> canceledAt = const Value.absent(),
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
  final Value<DateTime> createdAt;
  final Value<String?> forDate;
  final Value<bool> persistent;
  final Value<DateTime?> modifiedAt;
  final Value<DateTime?> completedAt;
  final Value<DateTime?> canceledAt;
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
    Expression<DateTime>? createdAt,
    Expression<String>? forDate,
    Expression<bool>? persistent,
    Expression<DateTime>? modifiedAt,
    Expression<DateTime>? completedAt,
    Expression<DateTime>? canceledAt,
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
    Value<DateTime>? createdAt,
    Value<String?>? forDate,
    Value<bool>? persistent,
    Value<DateTime?>? modifiedAt,
    Value<DateTime?>? completedAt,
    Value<DateTime?>? canceledAt,
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
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (forDate.present) {
      map['for_date'] = Variable<String>(forDate.value);
    }
    if (persistent.present) {
      map['persistent'] = Variable<bool>(persistent.value);
    }
    if (modifiedAt.present) {
      map['modified_at'] = Variable<DateTime>(modifiedAt.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    if (canceledAt.present) {
      map['canceled_at'] = Variable<DateTime>(canceledAt.value);
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
  );
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<int> colorIndex = GeneratedColumn<int>(
    'color',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: const CustomExpression(
      'CAST(strftime(\'%s\', CURRENT_TIMESTAMP) AS INTEGER)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, colorIndex, createdAt];
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
      colorIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}color'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  TagsTable createAlias(String alias) {
    return TagsTable(attachedDatabase, alias);
  }
}

class TagsTableData extends DataClass implements Insertable<TagsTableData> {
  final String id;
  final String name;
  final int colorIndex;
  final DateTime createdAt;
  const TagsTableData({
    required this.id,
    required this.name,
    required this.colorIndex,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['color'] = Variable<int>(colorIndex);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  TagsTableCompanion toCompanion(bool nullToAbsent) {
    return TagsTableCompanion(
      id: Value(id),
      name: Value(name),
      colorIndex: Value(colorIndex),
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
      colorIndex: serializer.fromJson<int>(json['colorIndex']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'colorIndex': serializer.toJson<int>(colorIndex),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  TagsTableData copyWith({
    String? id,
    String? name,
    int? colorIndex,
    DateTime? createdAt,
  }) => TagsTableData(
    id: id ?? this.id,
    name: name ?? this.name,
    colorIndex: colorIndex ?? this.colorIndex,
    createdAt: createdAt ?? this.createdAt,
  );
  TagsTableData copyWithCompanion(TagsTableCompanion data) {
    return TagsTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      colorIndex: data.colorIndex.present
          ? data.colorIndex.value
          : this.colorIndex,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TagsTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('colorIndex: $colorIndex, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, colorIndex, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TagsTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.colorIndex == this.colorIndex &&
          other.createdAt == this.createdAt);
}

class TagsTableCompanion extends UpdateCompanion<TagsTableData> {
  final Value<String> id;
  final Value<String> name;
  final Value<int> colorIndex;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const TagsTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.colorIndex = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TagsTableCompanion.insert({
    required String id,
    required String name,
    required int colorIndex,
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       colorIndex = Value(colorIndex);
  static Insertable<TagsTableData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<int>? colorIndex,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (colorIndex != null) 'color': colorIndex,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TagsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<int>? colorIndex,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return TagsTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      colorIndex: colorIndex ?? this.colorIndex,
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
    if (colorIndex.present) {
      map['color'] = Variable<int>(colorIndex.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
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
          ..write('colorIndex: $colorIndex, ')
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
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES tasks_table (id)',
    ),
  );
  late final GeneratedColumn<String> tag = GeneratedColumn<String>(
    'tag',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES tags_table (id)',
    ),
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

class DatabaseAtV6 extends GeneratedDatabase {
  DatabaseAtV6(QueryExecutor e) : super(e);
  late final TasksTable tasksTable = TasksTable(this);
  late final TagsTable tagsTable = TagsTable(this);
  late final TasksTagEntries tasksTagEntries = TasksTagEntries(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    tasksTable,
    tagsTable,
    tasksTagEntries,
  ];
  @override
  int get schemaVersion => 6;
}
