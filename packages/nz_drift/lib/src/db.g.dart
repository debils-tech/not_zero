// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// ignore_for_file: type=lint
class $TasksTableTable extends TasksTable
    with TableInfo<$TasksTableTable, Task> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TasksTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _forDateMeta =
      const VerificationMeta('forDate');
  @override
  late final GeneratedColumn<DateTime> forDate = GeneratedColumn<DateTime>(
      'for_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _persistentMeta =
      const VerificationMeta('persistent');
  @override
  late final GeneratedColumn<bool> persistent = GeneratedColumn<bool>(
      'persistent', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("persistent" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _modifiedAtMeta =
      const VerificationMeta('modifiedAt');
  @override
  late final GeneratedColumn<DateTime> modifiedAt = GeneratedColumn<DateTime>(
      'modified_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _completedAtMeta =
      const VerificationMeta('completedAt');
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
      'completed_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _importanceMeta =
      const VerificationMeta('importance');
  @override
  late final GeneratedColumnWithTypeConverter<TaskImportance, int> importance =
      GeneratedColumn<int>('importance', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<TaskImportance>($TasksTableTable.$converterimportance);
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
        importance
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tasks_table';
  @override
  VerificationContext validateIntegrity(Insertable<Task> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('for_date')) {
      context.handle(_forDateMeta,
          forDate.isAcceptableOrUnknown(data['for_date']!, _forDateMeta));
    } else if (isInserting) {
      context.missing(_forDateMeta);
    }
    if (data.containsKey('persistent')) {
      context.handle(
          _persistentMeta,
          persistent.isAcceptableOrUnknown(
              data['persistent']!, _persistentMeta));
    }
    if (data.containsKey('modified_at')) {
      context.handle(
          _modifiedAtMeta,
          modifiedAt.isAcceptableOrUnknown(
              data['modified_at']!, _modifiedAtMeta));
    }
    if (data.containsKey('completed_at')) {
      context.handle(
          _completedAtMeta,
          completedAt.isAcceptableOrUnknown(
              data['completed_at']!, _completedAtMeta));
    }
    context.handle(_importanceMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Task map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Task(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      importance: $TasksTableTable.$converterimportance.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}importance'])!),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      forDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}for_date'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      modifiedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}modified_at']),
      completedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}completed_at']),
      persistent: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}persistent'])!,
    );
  }

  @override
  $TasksTableTable createAlias(String alias) {
    return $TasksTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<TaskImportance, int, int> $converterimportance =
      const EnumIndexConverter<TaskImportance>(TaskImportance.values);
}

class TasksTableCompanion extends UpdateCompanion<Task> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> description;
  final Value<DateTime> createdAt;
  final Value<DateTime> forDate;
  final Value<bool> persistent;
  final Value<DateTime?> modifiedAt;
  final Value<DateTime?> completedAt;
  final Value<TaskImportance> importance;
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
    this.importance = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TasksTableCompanion.insert({
    required String id,
    required String title,
    required String description,
    required DateTime createdAt,
    required DateTime forDate,
    this.persistent = const Value.absent(),
    this.modifiedAt = const Value.absent(),
    this.completedAt = const Value.absent(),
    required TaskImportance importance,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title),
        description = Value(description),
        createdAt = Value(createdAt),
        forDate = Value(forDate),
        importance = Value(importance);
  static Insertable<Task> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? forDate,
    Expression<bool>? persistent,
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
      if (forDate != null) 'for_date': forDate,
      if (persistent != null) 'persistent': persistent,
      if (modifiedAt != null) 'modified_at': modifiedAt,
      if (completedAt != null) 'completed_at': completedAt,
      if (importance != null) 'importance': importance,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TasksTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<String>? description,
      Value<DateTime>? createdAt,
      Value<DateTime>? forDate,
      Value<bool>? persistent,
      Value<DateTime?>? modifiedAt,
      Value<DateTime?>? completedAt,
      Value<TaskImportance>? importance,
      Value<int>? rowid}) {
    return TasksTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      forDate: forDate ?? this.forDate,
      persistent: persistent ?? this.persistent,
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
    if (forDate.present) {
      map['for_date'] = Variable<DateTime>(forDate.value);
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
    if (importance.present) {
      map['importance'] = Variable<int>(
          $TasksTableTable.$converterimportance.toSql(importance.value));
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
          ..write('importance: $importance, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class _$TaskInsertable implements Insertable<Task> {
  Task _object;
  _$TaskInsertable(this._object);
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    return TasksTableCompanion(
      id: Value(_object.id),
      title: Value(_object.title),
      importance: Value(_object.importance),
      createdAt: Value(_object.createdAt),
      forDate: Value(_object.forDate),
      description: Value(_object.description),
      modifiedAt: Value(_object.modifiedAt),
      completedAt: Value(_object.completedAt),
      persistent: Value(_object.persistent),
    ).toColumns(false);
  }
}

extension TaskToInsertable on Task {
  _$TaskInsertable toInsertable() {
    return _$TaskInsertable(this);
  }
}

class $TagsTableTable extends TagsTable
    with TableInfo<$TagsTableTable, ItemTag> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TagsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _colorIndexMeta =
      const VerificationMeta('colorIndex');
  @override
  late final GeneratedColumn<int> colorIndex = GeneratedColumn<int>(
      'color', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, colorIndex, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tags_table';
  @override
  VerificationContext validateIntegrity(Insertable<ItemTag> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('color')) {
      context.handle(_colorIndexMeta,
          colorIndex.isAcceptableOrUnknown(data['color']!, _colorIndexMeta));
    } else if (isInserting) {
      context.missing(_colorIndexMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ItemTag map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ItemTag(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      colorIndex: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}color'])!,
    );
  }

  @override
  $TagsTableTable createAlias(String alias) {
    return $TagsTableTable(attachedDatabase, alias);
  }
}

class TagsTableCompanion extends UpdateCompanion<ItemTag> {
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
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        colorIndex = Value(colorIndex),
        createdAt = Value(createdAt);
  static Insertable<ItemTag> custom({
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

  TagsTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<int>? colorIndex,
      Value<DateTime>? createdAt,
      Value<int>? rowid}) {
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

class _$ItemTagInsertable implements Insertable<ItemTag> {
  ItemTag _object;
  _$ItemTagInsertable(this._object);
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    return TagsTableCompanion(
      id: Value(_object.id),
      name: Value(_object.name),
      createdAt: Value(_object.createdAt),
      colorIndex: Value(_object.colorIndex),
    ).toColumns(false);
  }
}

extension ItemTagToInsertable on ItemTag {
  _$ItemTagInsertable toInsertable() {
    return _$ItemTagInsertable(this);
  }
}

class $TasksTagEntriesTable extends TasksTagEntries
    with TableInfo<$TasksTagEntriesTable, TasksTagEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TasksTagEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _taskMeta = const VerificationMeta('task');
  @override
  late final GeneratedColumn<String> task = GeneratedColumn<String>(
      'task', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES tasks_table (id)'));
  static const VerificationMeta _tagMeta = const VerificationMeta('tag');
  @override
  late final GeneratedColumn<String> tag = GeneratedColumn<String>(
      'tag', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES tags_table (id)'));
  @override
  List<GeneratedColumn> get $columns => [task, tag];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tasks_tag_entries';
  @override
  VerificationContext validateIntegrity(Insertable<TasksTagEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('task')) {
      context.handle(
          _taskMeta, task.isAcceptableOrUnknown(data['task']!, _taskMeta));
    } else if (isInserting) {
      context.missing(_taskMeta);
    }
    if (data.containsKey('tag')) {
      context.handle(
          _tagMeta, tag.isAcceptableOrUnknown(data['tag']!, _tagMeta));
    } else if (isInserting) {
      context.missing(_tagMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {task, tag};
  @override
  TasksTagEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TasksTagEntry(
      task: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}task'])!,
      tag: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tag'])!,
    );
  }

  @override
  $TasksTagEntriesTable createAlias(String alias) {
    return $TasksTagEntriesTable(attachedDatabase, alias);
  }
}

class TasksTagEntry extends DataClass implements Insertable<TasksTagEntry> {
  final String task;
  final String tag;
  const TasksTagEntry({required this.task, required this.tag});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['task'] = Variable<String>(task);
    map['tag'] = Variable<String>(tag);
    return map;
  }

  TasksTagEntriesCompanion toCompanion(bool nullToAbsent) {
    return TasksTagEntriesCompanion(
      task: Value(task),
      tag: Value(tag),
    );
  }

  factory TasksTagEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TasksTagEntry(
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

  TasksTagEntry copyWith({String? task, String? tag}) => TasksTagEntry(
        task: task ?? this.task,
        tag: tag ?? this.tag,
      );
  TasksTagEntry copyWithCompanion(TasksTagEntriesCompanion data) {
    return TasksTagEntry(
      task: data.task.present ? data.task.value : this.task,
      tag: data.tag.present ? data.tag.value : this.tag,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TasksTagEntry(')
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
      (other is TasksTagEntry &&
          other.task == this.task &&
          other.tag == this.tag);
}

class TasksTagEntriesCompanion extends UpdateCompanion<TasksTagEntry> {
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
  })  : task = Value(task),
        tag = Value(tag);
  static Insertable<TasksTagEntry> custom({
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

  TasksTagEntriesCompanion copyWith(
      {Value<String>? task, Value<String>? tag, Value<int>? rowid}) {
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

abstract class _$NotZeroDatabase extends GeneratedDatabase {
  _$NotZeroDatabase(QueryExecutor e) : super(e);
  $NotZeroDatabaseManager get managers => $NotZeroDatabaseManager(this);
  late final $TasksTableTable tasksTable = $TasksTableTable(this);
  late final $TagsTableTable tagsTable = $TagsTableTable(this);
  late final $TasksTagEntriesTable tasksTagEntries =
      $TasksTagEntriesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [tasksTable, tagsTable, tasksTagEntries];
}

typedef $$TasksTableTableCreateCompanionBuilder = TasksTableCompanion Function({
  required String id,
  required String title,
  required String description,
  required DateTime createdAt,
  required DateTime forDate,
  Value<bool> persistent,
  Value<DateTime?> modifiedAt,
  Value<DateTime?> completedAt,
  required TaskImportance importance,
  Value<int> rowid,
});
typedef $$TasksTableTableUpdateCompanionBuilder = TasksTableCompanion Function({
  Value<String> id,
  Value<String> title,
  Value<String> description,
  Value<DateTime> createdAt,
  Value<DateTime> forDate,
  Value<bool> persistent,
  Value<DateTime?> modifiedAt,
  Value<DateTime?> completedAt,
  Value<TaskImportance> importance,
  Value<int> rowid,
});

final class $$TasksTableTableReferences
    extends BaseReferences<_$NotZeroDatabase, $TasksTableTable, Task> {
  $$TasksTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$TasksTagEntriesTable, List<TasksTagEntry>>
      _tasksTagEntriesRefsTable(_$NotZeroDatabase db) =>
          MultiTypedResultKey.fromTable(db.tasksTagEntries,
              aliasName: $_aliasNameGenerator(
                  db.tasksTable.id, db.tasksTagEntries.task));

  $$TasksTagEntriesTableProcessedTableManager get tasksTagEntriesRefs {
    final manager =
        $$TasksTagEntriesTableTableManager($_db, $_db.tasksTagEntries)
            .filter((f) => f.task.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_tasksTagEntriesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$TasksTableTableFilterComposer
    extends FilterComposer<_$NotZeroDatabase, $TasksTableTable> {
  $$TasksTableTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get forDate => $state.composableBuilder(
      column: $state.table.forDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get persistent => $state.composableBuilder(
      column: $state.table.persistent,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get modifiedAt => $state.composableBuilder(
      column: $state.table.modifiedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get completedAt => $state.composableBuilder(
      column: $state.table.completedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<TaskImportance, TaskImportance, int>
      get importance => $state.composableBuilder(
          column: $state.table.importance,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ComposableFilter tasksTagEntriesRefs(
      ComposableFilter Function($$TasksTagEntriesTableFilterComposer f) f) {
    final $$TasksTagEntriesTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $state.db.tasksTagEntries,
            getReferencedColumn: (t) => t.task,
            builder: (joinBuilder, parentComposers) =>
                $$TasksTagEntriesTableFilterComposer(ComposerState($state.db,
                    $state.db.tasksTagEntries, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$TasksTableTableOrderingComposer
    extends OrderingComposer<_$NotZeroDatabase, $TasksTableTable> {
  $$TasksTableTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get forDate => $state.composableBuilder(
      column: $state.table.forDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get persistent => $state.composableBuilder(
      column: $state.table.persistent,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get modifiedAt => $state.composableBuilder(
      column: $state.table.modifiedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get completedAt => $state.composableBuilder(
      column: $state.table.completedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get importance => $state.composableBuilder(
      column: $state.table.importance,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$TasksTableTableTableManager extends RootTableManager<
    _$NotZeroDatabase,
    $TasksTableTable,
    Task,
    $$TasksTableTableFilterComposer,
    $$TasksTableTableOrderingComposer,
    $$TasksTableTableCreateCompanionBuilder,
    $$TasksTableTableUpdateCompanionBuilder,
    (Task, $$TasksTableTableReferences),
    Task,
    PrefetchHooks Function({bool tasksTagEntriesRefs})> {
  $$TasksTableTableTableManager(_$NotZeroDatabase db, $TasksTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$TasksTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$TasksTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> forDate = const Value.absent(),
            Value<bool> persistent = const Value.absent(),
            Value<DateTime?> modifiedAt = const Value.absent(),
            Value<DateTime?> completedAt = const Value.absent(),
            Value<TaskImportance> importance = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TasksTableCompanion(
            id: id,
            title: title,
            description: description,
            createdAt: createdAt,
            forDate: forDate,
            persistent: persistent,
            modifiedAt: modifiedAt,
            completedAt: completedAt,
            importance: importance,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String title,
            required String description,
            required DateTime createdAt,
            required DateTime forDate,
            Value<bool> persistent = const Value.absent(),
            Value<DateTime?> modifiedAt = const Value.absent(),
            Value<DateTime?> completedAt = const Value.absent(),
            required TaskImportance importance,
            Value<int> rowid = const Value.absent(),
          }) =>
              TasksTableCompanion.insert(
            id: id,
            title: title,
            description: description,
            createdAt: createdAt,
            forDate: forDate,
            persistent: persistent,
            modifiedAt: modifiedAt,
            completedAt: completedAt,
            importance: importance,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$TasksTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({tasksTagEntriesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (tasksTagEntriesRefs) db.tasksTagEntries
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (tasksTagEntriesRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$TasksTableTableReferences
                            ._tasksTagEntriesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TasksTableTableReferences(db, table, p0)
                                .tasksTagEntriesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) =>
                                referencedItems.where((e) => e.task == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$TasksTableTableProcessedTableManager = ProcessedTableManager<
    _$NotZeroDatabase,
    $TasksTableTable,
    Task,
    $$TasksTableTableFilterComposer,
    $$TasksTableTableOrderingComposer,
    $$TasksTableTableCreateCompanionBuilder,
    $$TasksTableTableUpdateCompanionBuilder,
    (Task, $$TasksTableTableReferences),
    Task,
    PrefetchHooks Function({bool tasksTagEntriesRefs})>;
typedef $$TagsTableTableCreateCompanionBuilder = TagsTableCompanion Function({
  required String id,
  required String name,
  required int colorIndex,
  required DateTime createdAt,
  Value<int> rowid,
});
typedef $$TagsTableTableUpdateCompanionBuilder = TagsTableCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<int> colorIndex,
  Value<DateTime> createdAt,
  Value<int> rowid,
});

final class $$TagsTableTableReferences
    extends BaseReferences<_$NotZeroDatabase, $TagsTableTable, ItemTag> {
  $$TagsTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$TasksTagEntriesTable, List<TasksTagEntry>>
      _tasksTagEntriesRefsTable(_$NotZeroDatabase db) =>
          MultiTypedResultKey.fromTable(db.tasksTagEntries,
              aliasName: $_aliasNameGenerator(
                  db.tagsTable.id, db.tasksTagEntries.tag));

  $$TasksTagEntriesTableProcessedTableManager get tasksTagEntriesRefs {
    final manager =
        $$TasksTagEntriesTableTableManager($_db, $_db.tasksTagEntries)
            .filter((f) => f.tag.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_tasksTagEntriesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$TagsTableTableFilterComposer
    extends FilterComposer<_$NotZeroDatabase, $TagsTableTable> {
  $$TagsTableTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get colorIndex => $state.composableBuilder(
      column: $state.table.colorIndex,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter tasksTagEntriesRefs(
      ComposableFilter Function($$TasksTagEntriesTableFilterComposer f) f) {
    final $$TasksTagEntriesTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $state.db.tasksTagEntries,
            getReferencedColumn: (t) => t.tag,
            builder: (joinBuilder, parentComposers) =>
                $$TasksTagEntriesTableFilterComposer(ComposerState($state.db,
                    $state.db.tasksTagEntries, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$TagsTableTableOrderingComposer
    extends OrderingComposer<_$NotZeroDatabase, $TagsTableTable> {
  $$TagsTableTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get colorIndex => $state.composableBuilder(
      column: $state.table.colorIndex,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$TagsTableTableTableManager extends RootTableManager<
    _$NotZeroDatabase,
    $TagsTableTable,
    ItemTag,
    $$TagsTableTableFilterComposer,
    $$TagsTableTableOrderingComposer,
    $$TagsTableTableCreateCompanionBuilder,
    $$TagsTableTableUpdateCompanionBuilder,
    (ItemTag, $$TagsTableTableReferences),
    ItemTag,
    PrefetchHooks Function({bool tasksTagEntriesRefs})> {
  $$TagsTableTableTableManager(_$NotZeroDatabase db, $TagsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$TagsTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$TagsTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> colorIndex = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TagsTableCompanion(
            id: id,
            name: name,
            colorIndex: colorIndex,
            createdAt: createdAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            required int colorIndex,
            required DateTime createdAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              TagsTableCompanion.insert(
            id: id,
            name: name,
            colorIndex: colorIndex,
            createdAt: createdAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$TagsTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({tasksTagEntriesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (tasksTagEntriesRefs) db.tasksTagEntries
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (tasksTagEntriesRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$TagsTableTableReferences
                            ._tasksTagEntriesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TagsTableTableReferences(db, table, p0)
                                .tasksTagEntriesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) =>
                                referencedItems.where((e) => e.tag == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$TagsTableTableProcessedTableManager = ProcessedTableManager<
    _$NotZeroDatabase,
    $TagsTableTable,
    ItemTag,
    $$TagsTableTableFilterComposer,
    $$TagsTableTableOrderingComposer,
    $$TagsTableTableCreateCompanionBuilder,
    $$TagsTableTableUpdateCompanionBuilder,
    (ItemTag, $$TagsTableTableReferences),
    ItemTag,
    PrefetchHooks Function({bool tasksTagEntriesRefs})>;
typedef $$TasksTagEntriesTableCreateCompanionBuilder = TasksTagEntriesCompanion
    Function({
  required String task,
  required String tag,
  Value<int> rowid,
});
typedef $$TasksTagEntriesTableUpdateCompanionBuilder = TasksTagEntriesCompanion
    Function({
  Value<String> task,
  Value<String> tag,
  Value<int> rowid,
});

final class $$TasksTagEntriesTableReferences extends BaseReferences<
    _$NotZeroDatabase, $TasksTagEntriesTable, TasksTagEntry> {
  $$TasksTagEntriesTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $TasksTableTable _taskTable(_$NotZeroDatabase db) =>
      db.tasksTable.createAlias(
          $_aliasNameGenerator(db.tasksTagEntries.task, db.tasksTable.id));

  $$TasksTableTableProcessedTableManager? get task {
    if ($_item.task == null) return null;
    final manager = $$TasksTableTableTableManager($_db, $_db.tasksTable)
        .filter((f) => f.id($_item.task!));
    final item = $_typedResult.readTableOrNull(_taskTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $TagsTableTable _tagTable(_$NotZeroDatabase db) =>
      db.tagsTable.createAlias(
          $_aliasNameGenerator(db.tasksTagEntries.tag, db.tagsTable.id));

  $$TagsTableTableProcessedTableManager? get tag {
    if ($_item.tag == null) return null;
    final manager = $$TagsTableTableTableManager($_db, $_db.tagsTable)
        .filter((f) => f.id($_item.tag!));
    final item = $_typedResult.readTableOrNull(_tagTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$TasksTagEntriesTableFilterComposer
    extends FilterComposer<_$NotZeroDatabase, $TasksTagEntriesTable> {
  $$TasksTagEntriesTableFilterComposer(super.$state);
  $$TasksTableTableFilterComposer get task {
    final $$TasksTableTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.task,
        referencedTable: $state.db.tasksTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$TasksTableTableFilterComposer(ComposerState($state.db,
                $state.db.tasksTable, joinBuilder, parentComposers)));
    return composer;
  }

  $$TagsTableTableFilterComposer get tag {
    final $$TagsTableTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tag,
        referencedTable: $state.db.tagsTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$TagsTableTableFilterComposer(ComposerState(
                $state.db, $state.db.tagsTable, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$TasksTagEntriesTableOrderingComposer
    extends OrderingComposer<_$NotZeroDatabase, $TasksTagEntriesTable> {
  $$TasksTagEntriesTableOrderingComposer(super.$state);
  $$TasksTableTableOrderingComposer get task {
    final $$TasksTableTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.task,
        referencedTable: $state.db.tasksTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$TasksTableTableOrderingComposer(ComposerState($state.db,
                $state.db.tasksTable, joinBuilder, parentComposers)));
    return composer;
  }

  $$TagsTableTableOrderingComposer get tag {
    final $$TagsTableTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tag,
        referencedTable: $state.db.tagsTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$TagsTableTableOrderingComposer(ComposerState(
                $state.db, $state.db.tagsTable, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$TasksTagEntriesTableTableManager extends RootTableManager<
    _$NotZeroDatabase,
    $TasksTagEntriesTable,
    TasksTagEntry,
    $$TasksTagEntriesTableFilterComposer,
    $$TasksTagEntriesTableOrderingComposer,
    $$TasksTagEntriesTableCreateCompanionBuilder,
    $$TasksTagEntriesTableUpdateCompanionBuilder,
    (TasksTagEntry, $$TasksTagEntriesTableReferences),
    TasksTagEntry,
    PrefetchHooks Function({bool task, bool tag})> {
  $$TasksTagEntriesTableTableManager(
      _$NotZeroDatabase db, $TasksTagEntriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$TasksTagEntriesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$TasksTagEntriesTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> task = const Value.absent(),
            Value<String> tag = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TasksTagEntriesCompanion(
            task: task,
            tag: tag,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String task,
            required String tag,
            Value<int> rowid = const Value.absent(),
          }) =>
              TasksTagEntriesCompanion.insert(
            task: task,
            tag: tag,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$TasksTagEntriesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({task = false, tag = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (task) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.task,
                    referencedTable:
                        $$TasksTagEntriesTableReferences._taskTable(db),
                    referencedColumn:
                        $$TasksTagEntriesTableReferences._taskTable(db).id,
                  ) as T;
                }
                if (tag) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.tag,
                    referencedTable:
                        $$TasksTagEntriesTableReferences._tagTable(db),
                    referencedColumn:
                        $$TasksTagEntriesTableReferences._tagTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$TasksTagEntriesTableProcessedTableManager = ProcessedTableManager<
    _$NotZeroDatabase,
    $TasksTagEntriesTable,
    TasksTagEntry,
    $$TasksTagEntriesTableFilterComposer,
    $$TasksTagEntriesTableOrderingComposer,
    $$TasksTagEntriesTableCreateCompanionBuilder,
    $$TasksTagEntriesTableUpdateCompanionBuilder,
    (TasksTagEntry, $$TasksTagEntriesTableReferences),
    TasksTagEntry,
    PrefetchHooks Function({bool task, bool tag})>;

class $NotZeroDatabaseManager {
  final _$NotZeroDatabase _db;
  $NotZeroDatabaseManager(this._db);
  $$TasksTableTableTableManager get tasksTable =>
      $$TasksTableTableTableManager(_db, _db.tasksTable);
  $$TagsTableTableTableManager get tagsTable =>
      $$TagsTableTableTableManager(_db, _db.tagsTable);
  $$TasksTagEntriesTableTableManager get tasksTagEntries =>
      $$TasksTagEntriesTableTableManager(_db, _db.tasksTagEntries);
}
