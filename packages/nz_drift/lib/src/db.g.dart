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
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  late final GeneratedColumnWithTypeConverter<DateTime?, String> forDate =
      GeneratedColumn<String>(
        'for_date',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<DateTime?>($TasksTableTable.$converterforDaten);
  static const VerificationMeta _persistentMeta = const VerificationMeta(
    'persistent',
  );
  @override
  late final GeneratedColumn<bool> persistent = GeneratedColumn<bool>(
    'persistent',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("persistent" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _modifiedAtMeta = const VerificationMeta(
    'modifiedAt',
  );
  @override
  late final GeneratedColumn<DateTime> modifiedAt = GeneratedColumn<DateTime>(
    'modified_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _completedAtMeta = const VerificationMeta(
    'completedAt',
  );
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
    'completed_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _canceledAtMeta = const VerificationMeta(
    'canceledAt',
  );
  @override
  late final GeneratedColumn<DateTime> canceledAt = GeneratedColumn<DateTime>(
    'canceled_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<TaskImportance, int> importance =
      GeneratedColumn<int>(
        'importance',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<TaskImportance>($TasksTableTable.$converterimportance);
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
  VerificationContext validateIntegrity(
    Insertable<Task> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('persistent')) {
      context.handle(
        _persistentMeta,
        persistent.isAcceptableOrUnknown(data['persistent']!, _persistentMeta),
      );
    }
    if (data.containsKey('modified_at')) {
      context.handle(
        _modifiedAtMeta,
        modifiedAt.isAcceptableOrUnknown(data['modified_at']!, _modifiedAtMeta),
      );
    }
    if (data.containsKey('completed_at')) {
      context.handle(
        _completedAtMeta,
        completedAt.isAcceptableOrUnknown(
          data['completed_at']!,
          _completedAtMeta,
        ),
      );
    }
    if (data.containsKey('canceled_at')) {
      context.handle(
        _canceledAtMeta,
        canceledAt.isAcceptableOrUnknown(data['canceled_at']!, _canceledAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Task map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Task(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      importance: $TasksTableTable.$converterimportance.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}importance'],
        )!,
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
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
      forDate: $TasksTableTable.$converterforDaten.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}for_date'],
        ),
      ),
      persistent: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}persistent'],
      )!,
    );
  }

  @override
  $TasksTableTable createAlias(String alias) {
    return $TasksTableTable(attachedDatabase, alias);
  }

  static TypeConverter<DateTime, String> $converterforDate =
      const DateConverter();
  static TypeConverter<DateTime?, String?> $converterforDaten =
      NullAwareTypeConverter.wrap($converterforDate);
  static JsonTypeConverter2<TaskImportance, int, int> $converterimportance =
      const EnumIndexConverter<TaskImportance>(TaskImportance.values);
}

class TasksTableCompanion extends UpdateCompanion<Task> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> description;
  final Value<DateTime> createdAt;
  final Value<DateTime?> forDate;
  final Value<bool> persistent;
  final Value<DateTime?> modifiedAt;
  final Value<DateTime?> completedAt;
  final Value<DateTime?> canceledAt;
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
    required TaskImportance importance,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title),
       description = Value(description),
       importance = Value(importance);
  static Insertable<Task> custom({
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
    Value<DateTime?>? forDate,
    Value<bool>? persistent,
    Value<DateTime?>? modifiedAt,
    Value<DateTime?>? completedAt,
    Value<DateTime?>? canceledAt,
    Value<TaskImportance>? importance,
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
      map['for_date'] = Variable<String>(
        $TasksTableTable.$converterforDaten.toSql(forDate.value),
      );
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
      map['importance'] = Variable<int>(
        $TasksTableTable.$converterimportance.toSql(importance.value),
      );
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

class _$TaskInsertable implements Insertable<Task> {
  Task _object;
  _$TaskInsertable(this._object);
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    return TasksTableCompanion(
      id: Value(_object.id),
      title: Value(_object.title),
      description: Value(_object.description),
      createdAt: Value(_object.createdAt),
      forDate: Value(_object.forDate),
      persistent: Value(_object.persistent),
      modifiedAt: Value(_object.modifiedAt),
      completedAt: Value(_object.completedAt),
      canceledAt: Value(_object.canceledAt),
      importance: Value(_object.importance),
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
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _colorIndexMeta = const VerificationMeta(
    'colorIndex',
  );
  @override
  late final GeneratedColumn<int> colorIndex = GeneratedColumn<int>(
    'color',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, colorIndex, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tags_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ItemTag> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('color')) {
      context.handle(
        _colorIndexMeta,
        colorIndex.isAcceptableOrUnknown(data['color']!, _colorIndexMeta),
      );
    } else if (isInserting) {
      context.missing(_colorIndexMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ItemTag map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ItemTag(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      colorIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}color'],
      )!,
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
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       colorIndex = Value(colorIndex);
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

class _$ItemTagInsertable implements Insertable<ItemTag> {
  ItemTag _object;
  _$ItemTagInsertable(this._object);
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    return TagsTableCompanion(
      id: Value(_object.id),
      name: Value(_object.name),
      colorIndex: Value(_object.colorIndex),
      createdAt: Value(_object.createdAt),
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
    'task',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES tasks_table (id)',
    ),
  );
  static const VerificationMeta _tagMeta = const VerificationMeta('tag');
  @override
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
  VerificationContext validateIntegrity(
    Insertable<TasksTagEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('task')) {
      context.handle(
        _taskMeta,
        task.isAcceptableOrUnknown(data['task']!, _taskMeta),
      );
    } else if (isInserting) {
      context.missing(_taskMeta);
    }
    if (data.containsKey('tag')) {
      context.handle(
        _tagMeta,
        tag.isAcceptableOrUnknown(data['tag']!, _tagMeta),
      );
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
    return TasksTagEntriesCompanion(task: Value(task), tag: Value(tag));
  }

  factory TasksTagEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
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

  TasksTagEntry copyWith({String? task, String? tag}) =>
      TasksTagEntry(task: task ?? this.task, tag: tag ?? this.tag);
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
  }) : task = Value(task),
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

class $HabitsTableTable extends HabitsTable
    with TableInfo<$HabitsTableTable, Habit> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HabitsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _modifiedAtMeta = const VerificationMeta(
    'modifiedAt',
  );
  @override
  late final GeneratedColumn<DateTime> modifiedAt = GeneratedColumn<DateTime>(
    'modified_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<TaskImportance, int> importance =
      GeneratedColumn<int>(
        'importance',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<TaskImportance>($HabitsTableTable.$converterimportance);
  @override
  late final GeneratedColumnWithTypeConverter<HabitRegularity, String>
  regularity = GeneratedColumn<String>(
    'regularity',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: Constant(HabitRegularityConverter.defaultValue),
  ).withConverter<HabitRegularity>($HabitsTableTable.$converterregularity);
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    description,
    createdAt,
    modifiedAt,
    importance,
    regularity,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'habits_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<Habit> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('modified_at')) {
      context.handle(
        _modifiedAtMeta,
        modifiedAt.isAcceptableOrUnknown(data['modified_at']!, _modifiedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Habit map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Habit(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      importance: $HabitsTableTable.$converterimportance.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}importance'],
        )!,
      ),
      modifiedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}modified_at'],
      ),
      regularity: $HabitsTableTable.$converterregularity.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}regularity'],
        )!,
      ),
    );
  }

  @override
  $HabitsTableTable createAlias(String alias) {
    return $HabitsTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<TaskImportance, int, int> $converterimportance =
      const EnumIndexConverter<TaskImportance>(TaskImportance.values);
  static TypeConverter<HabitRegularity, String> $converterregularity =
      const HabitRegularityConverter();
}

class HabitsTableCompanion extends UpdateCompanion<Habit> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> description;
  final Value<DateTime> createdAt;
  final Value<DateTime?> modifiedAt;
  final Value<TaskImportance> importance;
  final Value<HabitRegularity> regularity;
  final Value<int> rowid;
  const HabitsTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.modifiedAt = const Value.absent(),
    this.importance = const Value.absent(),
    this.regularity = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  HabitsTableCompanion.insert({
    required String id,
    required String title,
    this.description = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.modifiedAt = const Value.absent(),
    required TaskImportance importance,
    this.regularity = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title),
       importance = Value(importance);
  static Insertable<Habit> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? modifiedAt,
    Expression<int>? importance,
    Expression<String>? regularity,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (createdAt != null) 'created_at': createdAt,
      if (modifiedAt != null) 'modified_at': modifiedAt,
      if (importance != null) 'importance': importance,
      if (regularity != null) 'regularity': regularity,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HabitsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<String>? description,
    Value<DateTime>? createdAt,
    Value<DateTime?>? modifiedAt,
    Value<TaskImportance>? importance,
    Value<HabitRegularity>? regularity,
    Value<int>? rowid,
  }) {
    return HabitsTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      modifiedAt: modifiedAt ?? this.modifiedAt,
      importance: importance ?? this.importance,
      regularity: regularity ?? this.regularity,
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
    if (importance.present) {
      map['importance'] = Variable<int>(
        $HabitsTableTable.$converterimportance.toSql(importance.value),
      );
    }
    if (regularity.present) {
      map['regularity'] = Variable<String>(
        $HabitsTableTable.$converterregularity.toSql(regularity.value),
      );
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
          ..write('regularity: $regularity, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class _$HabitInsertable implements Insertable<Habit> {
  Habit _object;
  _$HabitInsertable(this._object);
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    return HabitsTableCompanion(
      id: Value(_object.id),
      title: Value(_object.title),
      description: Value(_object.description),
      createdAt: Value(_object.createdAt),
      modifiedAt: Value(_object.modifiedAt),
      importance: Value(_object.importance),
      regularity: Value(_object.regularity),
    ).toColumns(false);
  }
}

extension HabitToInsertable on Habit {
  _$HabitInsertable toInsertable() {
    return _$HabitInsertable(this);
  }
}

class $HabitCompletionsTableTable extends HabitCompletionsTable
    with TableInfo<$HabitCompletionsTableTable, HabitCompletion> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HabitCompletionsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _habitIdMeta = const VerificationMeta(
    'habitId',
  );
  @override
  late final GeneratedColumn<String> habitId = GeneratedColumn<String>(
    'habit_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES habits_table (id)',
    ),
  );
  @override
  late final GeneratedColumnWithTypeConverter<HabitCompletionType, int> type =
      GeneratedColumn<int>(
        'type',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<HabitCompletionType>(
        $HabitCompletionsTableTable.$convertertype,
      );
  @override
  late final GeneratedColumnWithTypeConverter<DateTime, String> completedDate =
      GeneratedColumn<String>(
        'completed_date',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<DateTime>(
        $HabitCompletionsTableTable.$convertercompletedDate,
      );
  @override
  List<GeneratedColumn> get $columns => [id, habitId, type, completedDate];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'habit_completions_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<HabitCompletion> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('habit_id')) {
      context.handle(
        _habitIdMeta,
        habitId.isAcceptableOrUnknown(data['habit_id']!, _habitIdMeta),
      );
    } else if (isInserting) {
      context.missing(_habitIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {habitId, completedDate},
  ];
  @override
  HabitCompletion map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HabitCompletion(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      habitId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}habit_id'],
      )!,
      type: $HabitCompletionsTableTable.$convertertype.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}type'],
        )!,
      ),
      completedDate: $HabitCompletionsTableTable.$convertercompletedDate
          .fromSql(
            attachedDatabase.typeMapping.read(
              DriftSqlType.string,
              data['${effectivePrefix}completed_date'],
            )!,
          ),
    );
  }

  @override
  $HabitCompletionsTableTable createAlias(String alias) {
    return $HabitCompletionsTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<HabitCompletionType, int, int> $convertertype =
      const EnumIndexConverter<HabitCompletionType>(HabitCompletionType.values);
  static TypeConverter<DateTime, String> $convertercompletedDate =
      const DateConverter();
}

class HabitCompletionsTableCompanion extends UpdateCompanion<HabitCompletion> {
  final Value<String> id;
  final Value<String> habitId;
  final Value<HabitCompletionType> type;
  final Value<DateTime> completedDate;
  final Value<int> rowid;
  const HabitCompletionsTableCompanion({
    this.id = const Value.absent(),
    this.habitId = const Value.absent(),
    this.type = const Value.absent(),
    this.completedDate = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  HabitCompletionsTableCompanion.insert({
    required String id,
    required String habitId,
    required HabitCompletionType type,
    required DateTime completedDate,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       habitId = Value(habitId),
       type = Value(type),
       completedDate = Value(completedDate);
  static Insertable<HabitCompletion> custom({
    Expression<String>? id,
    Expression<String>? habitId,
    Expression<int>? type,
    Expression<String>? completedDate,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (habitId != null) 'habit_id': habitId,
      if (type != null) 'type': type,
      if (completedDate != null) 'completed_date': completedDate,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HabitCompletionsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? habitId,
    Value<HabitCompletionType>? type,
    Value<DateTime>? completedDate,
    Value<int>? rowid,
  }) {
    return HabitCompletionsTableCompanion(
      id: id ?? this.id,
      habitId: habitId ?? this.habitId,
      type: type ?? this.type,
      completedDate: completedDate ?? this.completedDate,
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
      map['type'] = Variable<int>(
        $HabitCompletionsTableTable.$convertertype.toSql(type.value),
      );
    }
    if (completedDate.present) {
      map['completed_date'] = Variable<String>(
        $HabitCompletionsTableTable.$convertercompletedDate.toSql(
          completedDate.value,
        ),
      );
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
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class _$HabitCompletionInsertable implements Insertable<HabitCompletion> {
  HabitCompletion _object;
  _$HabitCompletionInsertable(this._object);
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    return HabitCompletionsTableCompanion(
      id: Value(_object.id),
      habitId: Value(_object.habitId),
      type: Value(_object.type),
      completedDate: Value(_object.completedDate),
    ).toColumns(false);
  }
}

extension HabitCompletionToInsertable on HabitCompletion {
  _$HabitCompletionInsertable toInsertable() {
    return _$HabitCompletionInsertable(this);
  }
}

class $HabitsTagEntriesTable extends HabitsTagEntries
    with TableInfo<$HabitsTagEntriesTable, HabitsTagEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HabitsTagEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _habitMeta = const VerificationMeta('habit');
  @override
  late final GeneratedColumn<String> habit = GeneratedColumn<String>(
    'habit',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES habits_table (id)',
    ),
  );
  static const VerificationMeta _tagMeta = const VerificationMeta('tag');
  @override
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
  List<GeneratedColumn> get $columns => [habit, tag];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'habits_tag_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<HabitsTagEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('habit')) {
      context.handle(
        _habitMeta,
        habit.isAcceptableOrUnknown(data['habit']!, _habitMeta),
      );
    } else if (isInserting) {
      context.missing(_habitMeta);
    }
    if (data.containsKey('tag')) {
      context.handle(
        _tagMeta,
        tag.isAcceptableOrUnknown(data['tag']!, _tagMeta),
      );
    } else if (isInserting) {
      context.missing(_tagMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {habit, tag};
  @override
  HabitsTagEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HabitsTagEntry(
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
  $HabitsTagEntriesTable createAlias(String alias) {
    return $HabitsTagEntriesTable(attachedDatabase, alias);
  }
}

class HabitsTagEntry extends DataClass implements Insertable<HabitsTagEntry> {
  final String habit;
  final String tag;
  const HabitsTagEntry({required this.habit, required this.tag});
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

  factory HabitsTagEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HabitsTagEntry(
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

  HabitsTagEntry copyWith({String? habit, String? tag}) =>
      HabitsTagEntry(habit: habit ?? this.habit, tag: tag ?? this.tag);
  HabitsTagEntry copyWithCompanion(HabitsTagEntriesCompanion data) {
    return HabitsTagEntry(
      habit: data.habit.present ? data.habit.value : this.habit,
      tag: data.tag.present ? data.tag.value : this.tag,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HabitsTagEntry(')
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
      (other is HabitsTagEntry &&
          other.habit == this.habit &&
          other.tag == this.tag);
}

class HabitsTagEntriesCompanion extends UpdateCompanion<HabitsTagEntry> {
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
  static Insertable<HabitsTagEntry> custom({
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

abstract class _$NotZeroDatabase extends GeneratedDatabase {
  _$NotZeroDatabase(QueryExecutor e) : super(e);
  $NotZeroDatabaseManager get managers => $NotZeroDatabaseManager(this);
  late final $TasksTableTable tasksTable = $TasksTableTable(this);
  late final $TagsTableTable tagsTable = $TagsTableTable(this);
  late final $TasksTagEntriesTable tasksTagEntries = $TasksTagEntriesTable(
    this,
  );
  late final $HabitsTableTable habitsTable = $HabitsTableTable(this);
  late final $HabitCompletionsTableTable habitCompletionsTable =
      $HabitCompletionsTableTable(this);
  late final $HabitsTagEntriesTable habitsTagEntries = $HabitsTagEntriesTable(
    this,
  );
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
  ];
}

typedef $$TasksTableTableCreateCompanionBuilder =
    TasksTableCompanion Function({
      required String id,
      required String title,
      required String description,
      Value<DateTime> createdAt,
      Value<DateTime?> forDate,
      Value<bool> persistent,
      Value<DateTime?> modifiedAt,
      Value<DateTime?> completedAt,
      Value<DateTime?> canceledAt,
      required TaskImportance importance,
      Value<int> rowid,
    });
typedef $$TasksTableTableUpdateCompanionBuilder =
    TasksTableCompanion Function({
      Value<String> id,
      Value<String> title,
      Value<String> description,
      Value<DateTime> createdAt,
      Value<DateTime?> forDate,
      Value<bool> persistent,
      Value<DateTime?> modifiedAt,
      Value<DateTime?> completedAt,
      Value<DateTime?> canceledAt,
      Value<TaskImportance> importance,
      Value<int> rowid,
    });

final class $$TasksTableTableReferences
    extends BaseReferences<_$NotZeroDatabase, $TasksTableTable, Task> {
  $$TasksTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$TasksTagEntriesTable, List<TasksTagEntry>>
  _tasksTagEntriesRefsTable(_$NotZeroDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.tasksTagEntries,
        aliasName: $_aliasNameGenerator(
          db.tasksTable.id,
          db.tasksTagEntries.task,
        ),
      );

  $$TasksTagEntriesTableProcessedTableManager get tasksTagEntriesRefs {
    final manager = $$TasksTagEntriesTableTableManager(
      $_db,
      $_db.tasksTagEntries,
    ).filter((f) => f.task.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _tasksTagEntriesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$TasksTableTableFilterComposer
    extends Composer<_$NotZeroDatabase, $TasksTableTable> {
  $$TasksTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<DateTime?, DateTime, String> get forDate =>
      $composableBuilder(
        column: $table.forDate,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<bool> get persistent => $composableBuilder(
    column: $table.persistent,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get modifiedAt => $composableBuilder(
    column: $table.modifiedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get canceledAt => $composableBuilder(
    column: $table.canceledAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<TaskImportance, TaskImportance, int>
  get importance => $composableBuilder(
    column: $table.importance,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  Expression<bool> tasksTagEntriesRefs(
    Expression<bool> Function($$TasksTagEntriesTableFilterComposer f) f,
  ) {
    final $$TasksTagEntriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.tasksTagEntries,
      getReferencedColumn: (t) => t.task,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TasksTagEntriesTableFilterComposer(
            $db: $db,
            $table: $db.tasksTagEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TasksTableTableOrderingComposer
    extends Composer<_$NotZeroDatabase, $TasksTableTable> {
  $$TasksTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get forDate => $composableBuilder(
    column: $table.forDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get persistent => $composableBuilder(
    column: $table.persistent,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get modifiedAt => $composableBuilder(
    column: $table.modifiedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get canceledAt => $composableBuilder(
    column: $table.canceledAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get importance => $composableBuilder(
    column: $table.importance,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TasksTableTableAnnotationComposer
    extends Composer<_$NotZeroDatabase, $TasksTableTable> {
  $$TasksTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumnWithTypeConverter<DateTime?, String> get forDate =>
      $composableBuilder(column: $table.forDate, builder: (column) => column);

  GeneratedColumn<bool> get persistent => $composableBuilder(
    column: $table.persistent,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get modifiedAt => $composableBuilder(
    column: $table.modifiedAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get canceledAt => $composableBuilder(
    column: $table.canceledAt,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<TaskImportance, int> get importance =>
      $composableBuilder(
        column: $table.importance,
        builder: (column) => column,
      );

  Expression<T> tasksTagEntriesRefs<T extends Object>(
    Expression<T> Function($$TasksTagEntriesTableAnnotationComposer a) f,
  ) {
    final $$TasksTagEntriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.tasksTagEntries,
      getReferencedColumn: (t) => t.task,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TasksTagEntriesTableAnnotationComposer(
            $db: $db,
            $table: $db.tasksTagEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TasksTableTableTableManager
    extends
        RootTableManager<
          _$NotZeroDatabase,
          $TasksTableTable,
          Task,
          $$TasksTableTableFilterComposer,
          $$TasksTableTableOrderingComposer,
          $$TasksTableTableAnnotationComposer,
          $$TasksTableTableCreateCompanionBuilder,
          $$TasksTableTableUpdateCompanionBuilder,
          (Task, $$TasksTableTableReferences),
          Task,
          PrefetchHooks Function({bool tasksTagEntriesRefs})
        > {
  $$TasksTableTableTableManager(_$NotZeroDatabase db, $TasksTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TasksTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TasksTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TasksTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> forDate = const Value.absent(),
                Value<bool> persistent = const Value.absent(),
                Value<DateTime?> modifiedAt = const Value.absent(),
                Value<DateTime?> completedAt = const Value.absent(),
                Value<DateTime?> canceledAt = const Value.absent(),
                Value<TaskImportance> importance = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TasksTableCompanion(
                id: id,
                title: title,
                description: description,
                createdAt: createdAt,
                forDate: forDate,
                persistent: persistent,
                modifiedAt: modifiedAt,
                completedAt: completedAt,
                canceledAt: canceledAt,
                importance: importance,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String title,
                required String description,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> forDate = const Value.absent(),
                Value<bool> persistent = const Value.absent(),
                Value<DateTime?> modifiedAt = const Value.absent(),
                Value<DateTime?> completedAt = const Value.absent(),
                Value<DateTime?> canceledAt = const Value.absent(),
                required TaskImportance importance,
                Value<int> rowid = const Value.absent(),
              }) => TasksTableCompanion.insert(
                id: id,
                title: title,
                description: description,
                createdAt: createdAt,
                forDate: forDate,
                persistent: persistent,
                modifiedAt: modifiedAt,
                completedAt: completedAt,
                canceledAt: canceledAt,
                importance: importance,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TasksTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({tasksTagEntriesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (tasksTagEntriesRefs) db.tasksTagEntries,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (tasksTagEntriesRefs)
                    await $_getPrefetchedData<
                      Task,
                      $TasksTableTable,
                      TasksTagEntry
                    >(
                      currentTable: table,
                      referencedTable: $$TasksTableTableReferences
                          ._tasksTagEntriesRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$TasksTableTableReferences(
                            db,
                            table,
                            p0,
                          ).tasksTagEntriesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.task == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$TasksTableTableProcessedTableManager =
    ProcessedTableManager<
      _$NotZeroDatabase,
      $TasksTableTable,
      Task,
      $$TasksTableTableFilterComposer,
      $$TasksTableTableOrderingComposer,
      $$TasksTableTableAnnotationComposer,
      $$TasksTableTableCreateCompanionBuilder,
      $$TasksTableTableUpdateCompanionBuilder,
      (Task, $$TasksTableTableReferences),
      Task,
      PrefetchHooks Function({bool tasksTagEntriesRefs})
    >;
typedef $$TagsTableTableCreateCompanionBuilder =
    TagsTableCompanion Function({
      required String id,
      required String name,
      required int colorIndex,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });
typedef $$TagsTableTableUpdateCompanionBuilder =
    TagsTableCompanion Function({
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
      MultiTypedResultKey.fromTable(
        db.tasksTagEntries,
        aliasName: $_aliasNameGenerator(
          db.tagsTable.id,
          db.tasksTagEntries.tag,
        ),
      );

  $$TasksTagEntriesTableProcessedTableManager get tasksTagEntriesRefs {
    final manager = $$TasksTagEntriesTableTableManager(
      $_db,
      $_db.tasksTagEntries,
    ).filter((f) => f.tag.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _tasksTagEntriesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$HabitsTagEntriesTable, List<HabitsTagEntry>>
  _habitsTagEntriesRefsTable(_$NotZeroDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.habitsTagEntries,
        aliasName: $_aliasNameGenerator(
          db.tagsTable.id,
          db.habitsTagEntries.tag,
        ),
      );

  $$HabitsTagEntriesTableProcessedTableManager get habitsTagEntriesRefs {
    final manager = $$HabitsTagEntriesTableTableManager(
      $_db,
      $_db.habitsTagEntries,
    ).filter((f) => f.tag.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _habitsTagEntriesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$TagsTableTableFilterComposer
    extends Composer<_$NotZeroDatabase, $TagsTableTable> {
  $$TagsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get colorIndex => $composableBuilder(
    column: $table.colorIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> tasksTagEntriesRefs(
    Expression<bool> Function($$TasksTagEntriesTableFilterComposer f) f,
  ) {
    final $$TasksTagEntriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.tasksTagEntries,
      getReferencedColumn: (t) => t.tag,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TasksTagEntriesTableFilterComposer(
            $db: $db,
            $table: $db.tasksTagEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> habitsTagEntriesRefs(
    Expression<bool> Function($$HabitsTagEntriesTableFilterComposer f) f,
  ) {
    final $$HabitsTagEntriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.habitsTagEntries,
      getReferencedColumn: (t) => t.tag,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HabitsTagEntriesTableFilterComposer(
            $db: $db,
            $table: $db.habitsTagEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TagsTableTableOrderingComposer
    extends Composer<_$NotZeroDatabase, $TagsTableTable> {
  $$TagsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get colorIndex => $composableBuilder(
    column: $table.colorIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TagsTableTableAnnotationComposer
    extends Composer<_$NotZeroDatabase, $TagsTableTable> {
  $$TagsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get colorIndex => $composableBuilder(
    column: $table.colorIndex,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> tasksTagEntriesRefs<T extends Object>(
    Expression<T> Function($$TasksTagEntriesTableAnnotationComposer a) f,
  ) {
    final $$TasksTagEntriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.tasksTagEntries,
      getReferencedColumn: (t) => t.tag,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TasksTagEntriesTableAnnotationComposer(
            $db: $db,
            $table: $db.tasksTagEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> habitsTagEntriesRefs<T extends Object>(
    Expression<T> Function($$HabitsTagEntriesTableAnnotationComposer a) f,
  ) {
    final $$HabitsTagEntriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.habitsTagEntries,
      getReferencedColumn: (t) => t.tag,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HabitsTagEntriesTableAnnotationComposer(
            $db: $db,
            $table: $db.habitsTagEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TagsTableTableTableManager
    extends
        RootTableManager<
          _$NotZeroDatabase,
          $TagsTableTable,
          ItemTag,
          $$TagsTableTableFilterComposer,
          $$TagsTableTableOrderingComposer,
          $$TagsTableTableAnnotationComposer,
          $$TagsTableTableCreateCompanionBuilder,
          $$TagsTableTableUpdateCompanionBuilder,
          (ItemTag, $$TagsTableTableReferences),
          ItemTag,
          PrefetchHooks Function({
            bool tasksTagEntriesRefs,
            bool habitsTagEntriesRefs,
          })
        > {
  $$TagsTableTableTableManager(_$NotZeroDatabase db, $TagsTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TagsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TagsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TagsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> colorIndex = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TagsTableCompanion(
                id: id,
                name: name,
                colorIndex: colorIndex,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required int colorIndex,
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TagsTableCompanion.insert(
                id: id,
                name: name,
                colorIndex: colorIndex,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TagsTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({tasksTagEntriesRefs = false, habitsTagEntriesRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (tasksTagEntriesRefs) db.tasksTagEntries,
                    if (habitsTagEntriesRefs) db.habitsTagEntries,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (tasksTagEntriesRefs)
                        await $_getPrefetchedData<
                          ItemTag,
                          $TagsTableTable,
                          TasksTagEntry
                        >(
                          currentTable: table,
                          referencedTable: $$TagsTableTableReferences
                              ._tasksTagEntriesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TagsTableTableReferences(
                                db,
                                table,
                                p0,
                              ).tasksTagEntriesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.tag == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (habitsTagEntriesRefs)
                        await $_getPrefetchedData<
                          ItemTag,
                          $TagsTableTable,
                          HabitsTagEntry
                        >(
                          currentTable: table,
                          referencedTable: $$TagsTableTableReferences
                              ._habitsTagEntriesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TagsTableTableReferences(
                                db,
                                table,
                                p0,
                              ).habitsTagEntriesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.tag == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$TagsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$NotZeroDatabase,
      $TagsTableTable,
      ItemTag,
      $$TagsTableTableFilterComposer,
      $$TagsTableTableOrderingComposer,
      $$TagsTableTableAnnotationComposer,
      $$TagsTableTableCreateCompanionBuilder,
      $$TagsTableTableUpdateCompanionBuilder,
      (ItemTag, $$TagsTableTableReferences),
      ItemTag,
      PrefetchHooks Function({
        bool tasksTagEntriesRefs,
        bool habitsTagEntriesRefs,
      })
    >;
typedef $$TasksTagEntriesTableCreateCompanionBuilder =
    TasksTagEntriesCompanion Function({
      required String task,
      required String tag,
      Value<int> rowid,
    });
typedef $$TasksTagEntriesTableUpdateCompanionBuilder =
    TasksTagEntriesCompanion Function({
      Value<String> task,
      Value<String> tag,
      Value<int> rowid,
    });

final class $$TasksTagEntriesTableReferences
    extends
        BaseReferences<
          _$NotZeroDatabase,
          $TasksTagEntriesTable,
          TasksTagEntry
        > {
  $$TasksTagEntriesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $TasksTableTable _taskTable(_$NotZeroDatabase db) =>
      db.tasksTable.createAlias(
        $_aliasNameGenerator(db.tasksTagEntries.task, db.tasksTable.id),
      );

  $$TasksTableTableProcessedTableManager get task {
    final $_column = $_itemColumn<String>('task')!;

    final manager = $$TasksTableTableTableManager(
      $_db,
      $_db.tasksTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_taskTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $TagsTableTable _tagTable(_$NotZeroDatabase db) =>
      db.tagsTable.createAlias(
        $_aliasNameGenerator(db.tasksTagEntries.tag, db.tagsTable.id),
      );

  $$TagsTableTableProcessedTableManager get tag {
    final $_column = $_itemColumn<String>('tag')!;

    final manager = $$TagsTableTableTableManager(
      $_db,
      $_db.tagsTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_tagTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$TasksTagEntriesTableFilterComposer
    extends Composer<_$NotZeroDatabase, $TasksTagEntriesTable> {
  $$TasksTagEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$TasksTableTableFilterComposer get task {
    final $$TasksTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.task,
      referencedTable: $db.tasksTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TasksTableTableFilterComposer(
            $db: $db,
            $table: $db.tasksTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TagsTableTableFilterComposer get tag {
    final $$TagsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tag,
      referencedTable: $db.tagsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TagsTableTableFilterComposer(
            $db: $db,
            $table: $db.tagsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TasksTagEntriesTableOrderingComposer
    extends Composer<_$NotZeroDatabase, $TasksTagEntriesTable> {
  $$TasksTagEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$TasksTableTableOrderingComposer get task {
    final $$TasksTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.task,
      referencedTable: $db.tasksTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TasksTableTableOrderingComposer(
            $db: $db,
            $table: $db.tasksTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TagsTableTableOrderingComposer get tag {
    final $$TagsTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tag,
      referencedTable: $db.tagsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TagsTableTableOrderingComposer(
            $db: $db,
            $table: $db.tagsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TasksTagEntriesTableAnnotationComposer
    extends Composer<_$NotZeroDatabase, $TasksTagEntriesTable> {
  $$TasksTagEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$TasksTableTableAnnotationComposer get task {
    final $$TasksTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.task,
      referencedTable: $db.tasksTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TasksTableTableAnnotationComposer(
            $db: $db,
            $table: $db.tasksTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TagsTableTableAnnotationComposer get tag {
    final $$TagsTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tag,
      referencedTable: $db.tagsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TagsTableTableAnnotationComposer(
            $db: $db,
            $table: $db.tagsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TasksTagEntriesTableTableManager
    extends
        RootTableManager<
          _$NotZeroDatabase,
          $TasksTagEntriesTable,
          TasksTagEntry,
          $$TasksTagEntriesTableFilterComposer,
          $$TasksTagEntriesTableOrderingComposer,
          $$TasksTagEntriesTableAnnotationComposer,
          $$TasksTagEntriesTableCreateCompanionBuilder,
          $$TasksTagEntriesTableUpdateCompanionBuilder,
          (TasksTagEntry, $$TasksTagEntriesTableReferences),
          TasksTagEntry,
          PrefetchHooks Function({bool task, bool tag})
        > {
  $$TasksTagEntriesTableTableManager(
    _$NotZeroDatabase db,
    $TasksTagEntriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TasksTagEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TasksTagEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TasksTagEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> task = const Value.absent(),
                Value<String> tag = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) =>
                  TasksTagEntriesCompanion(task: task, tag: tag, rowid: rowid),
          createCompanionCallback:
              ({
                required String task,
                required String tag,
                Value<int> rowid = const Value.absent(),
              }) => TasksTagEntriesCompanion.insert(
                task: task,
                tag: tag,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TasksTagEntriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({task = false, tag = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
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
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (task) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.task,
                                referencedTable:
                                    $$TasksTagEntriesTableReferences._taskTable(
                                      db,
                                    ),
                                referencedColumn:
                                    $$TasksTagEntriesTableReferences
                                        ._taskTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (tag) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.tag,
                                referencedTable:
                                    $$TasksTagEntriesTableReferences._tagTable(
                                      db,
                                    ),
                                referencedColumn:
                                    $$TasksTagEntriesTableReferences
                                        ._tagTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$TasksTagEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$NotZeroDatabase,
      $TasksTagEntriesTable,
      TasksTagEntry,
      $$TasksTagEntriesTableFilterComposer,
      $$TasksTagEntriesTableOrderingComposer,
      $$TasksTagEntriesTableAnnotationComposer,
      $$TasksTagEntriesTableCreateCompanionBuilder,
      $$TasksTagEntriesTableUpdateCompanionBuilder,
      (TasksTagEntry, $$TasksTagEntriesTableReferences),
      TasksTagEntry,
      PrefetchHooks Function({bool task, bool tag})
    >;
typedef $$HabitsTableTableCreateCompanionBuilder =
    HabitsTableCompanion Function({
      required String id,
      required String title,
      Value<String> description,
      Value<DateTime> createdAt,
      Value<DateTime?> modifiedAt,
      required TaskImportance importance,
      Value<HabitRegularity> regularity,
      Value<int> rowid,
    });
typedef $$HabitsTableTableUpdateCompanionBuilder =
    HabitsTableCompanion Function({
      Value<String> id,
      Value<String> title,
      Value<String> description,
      Value<DateTime> createdAt,
      Value<DateTime?> modifiedAt,
      Value<TaskImportance> importance,
      Value<HabitRegularity> regularity,
      Value<int> rowid,
    });

final class $$HabitsTableTableReferences
    extends BaseReferences<_$NotZeroDatabase, $HabitsTableTable, Habit> {
  $$HabitsTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$HabitCompletionsTableTable, List<HabitCompletion>>
  _habitCompletionsTableRefsTable(_$NotZeroDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.habitCompletionsTable,
        aliasName: $_aliasNameGenerator(
          db.habitsTable.id,
          db.habitCompletionsTable.habitId,
        ),
      );

  $$HabitCompletionsTableTableProcessedTableManager
  get habitCompletionsTableRefs {
    final manager = $$HabitCompletionsTableTableTableManager(
      $_db,
      $_db.habitCompletionsTable,
    ).filter((f) => f.habitId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _habitCompletionsTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$HabitsTagEntriesTable, List<HabitsTagEntry>>
  _habitsTagEntriesRefsTable(_$NotZeroDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.habitsTagEntries,
        aliasName: $_aliasNameGenerator(
          db.habitsTable.id,
          db.habitsTagEntries.habit,
        ),
      );

  $$HabitsTagEntriesTableProcessedTableManager get habitsTagEntriesRefs {
    final manager = $$HabitsTagEntriesTableTableManager(
      $_db,
      $_db.habitsTagEntries,
    ).filter((f) => f.habit.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _habitsTagEntriesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$HabitsTableTableFilterComposer
    extends Composer<_$NotZeroDatabase, $HabitsTableTable> {
  $$HabitsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get modifiedAt => $composableBuilder(
    column: $table.modifiedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<TaskImportance, TaskImportance, int>
  get importance => $composableBuilder(
    column: $table.importance,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<HabitRegularity, HabitRegularity, String>
  get regularity => $composableBuilder(
    column: $table.regularity,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  Expression<bool> habitCompletionsTableRefs(
    Expression<bool> Function($$HabitCompletionsTableTableFilterComposer f) f,
  ) {
    final $$HabitCompletionsTableTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.habitCompletionsTable,
          getReferencedColumn: (t) => t.habitId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$HabitCompletionsTableTableFilterComposer(
                $db: $db,
                $table: $db.habitCompletionsTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> habitsTagEntriesRefs(
    Expression<bool> Function($$HabitsTagEntriesTableFilterComposer f) f,
  ) {
    final $$HabitsTagEntriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.habitsTagEntries,
      getReferencedColumn: (t) => t.habit,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HabitsTagEntriesTableFilterComposer(
            $db: $db,
            $table: $db.habitsTagEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$HabitsTableTableOrderingComposer
    extends Composer<_$NotZeroDatabase, $HabitsTableTable> {
  $$HabitsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get modifiedAt => $composableBuilder(
    column: $table.modifiedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get importance => $composableBuilder(
    column: $table.importance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get regularity => $composableBuilder(
    column: $table.regularity,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$HabitsTableTableAnnotationComposer
    extends Composer<_$NotZeroDatabase, $HabitsTableTable> {
  $$HabitsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get modifiedAt => $composableBuilder(
    column: $table.modifiedAt,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<TaskImportance, int> get importance =>
      $composableBuilder(
        column: $table.importance,
        builder: (column) => column,
      );

  GeneratedColumnWithTypeConverter<HabitRegularity, String> get regularity =>
      $composableBuilder(
        column: $table.regularity,
        builder: (column) => column,
      );

  Expression<T> habitCompletionsTableRefs<T extends Object>(
    Expression<T> Function($$HabitCompletionsTableTableAnnotationComposer a) f,
  ) {
    final $$HabitCompletionsTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.habitCompletionsTable,
          getReferencedColumn: (t) => t.habitId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$HabitCompletionsTableTableAnnotationComposer(
                $db: $db,
                $table: $db.habitCompletionsTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> habitsTagEntriesRefs<T extends Object>(
    Expression<T> Function($$HabitsTagEntriesTableAnnotationComposer a) f,
  ) {
    final $$HabitsTagEntriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.habitsTagEntries,
      getReferencedColumn: (t) => t.habit,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HabitsTagEntriesTableAnnotationComposer(
            $db: $db,
            $table: $db.habitsTagEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$HabitsTableTableTableManager
    extends
        RootTableManager<
          _$NotZeroDatabase,
          $HabitsTableTable,
          Habit,
          $$HabitsTableTableFilterComposer,
          $$HabitsTableTableOrderingComposer,
          $$HabitsTableTableAnnotationComposer,
          $$HabitsTableTableCreateCompanionBuilder,
          $$HabitsTableTableUpdateCompanionBuilder,
          (Habit, $$HabitsTableTableReferences),
          Habit,
          PrefetchHooks Function({
            bool habitCompletionsTableRefs,
            bool habitsTagEntriesRefs,
          })
        > {
  $$HabitsTableTableTableManager(_$NotZeroDatabase db, $HabitsTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HabitsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HabitsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HabitsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> modifiedAt = const Value.absent(),
                Value<TaskImportance> importance = const Value.absent(),
                Value<HabitRegularity> regularity = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => HabitsTableCompanion(
                id: id,
                title: title,
                description: description,
                createdAt: createdAt,
                modifiedAt: modifiedAt,
                importance: importance,
                regularity: regularity,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String title,
                Value<String> description = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> modifiedAt = const Value.absent(),
                required TaskImportance importance,
                Value<HabitRegularity> regularity = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => HabitsTableCompanion.insert(
                id: id,
                title: title,
                description: description,
                createdAt: createdAt,
                modifiedAt: modifiedAt,
                importance: importance,
                regularity: regularity,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$HabitsTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                habitCompletionsTableRefs = false,
                habitsTagEntriesRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (habitCompletionsTableRefs) db.habitCompletionsTable,
                    if (habitsTagEntriesRefs) db.habitsTagEntries,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (habitCompletionsTableRefs)
                        await $_getPrefetchedData<
                          Habit,
                          $HabitsTableTable,
                          HabitCompletion
                        >(
                          currentTable: table,
                          referencedTable: $$HabitsTableTableReferences
                              ._habitCompletionsTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$HabitsTableTableReferences(
                                db,
                                table,
                                p0,
                              ).habitCompletionsTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.habitId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (habitsTagEntriesRefs)
                        await $_getPrefetchedData<
                          Habit,
                          $HabitsTableTable,
                          HabitsTagEntry
                        >(
                          currentTable: table,
                          referencedTable: $$HabitsTableTableReferences
                              ._habitsTagEntriesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$HabitsTableTableReferences(
                                db,
                                table,
                                p0,
                              ).habitsTagEntriesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.habit == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$HabitsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$NotZeroDatabase,
      $HabitsTableTable,
      Habit,
      $$HabitsTableTableFilterComposer,
      $$HabitsTableTableOrderingComposer,
      $$HabitsTableTableAnnotationComposer,
      $$HabitsTableTableCreateCompanionBuilder,
      $$HabitsTableTableUpdateCompanionBuilder,
      (Habit, $$HabitsTableTableReferences),
      Habit,
      PrefetchHooks Function({
        bool habitCompletionsTableRefs,
        bool habitsTagEntriesRefs,
      })
    >;
typedef $$HabitCompletionsTableTableCreateCompanionBuilder =
    HabitCompletionsTableCompanion Function({
      required String id,
      required String habitId,
      required HabitCompletionType type,
      required DateTime completedDate,
      Value<int> rowid,
    });
typedef $$HabitCompletionsTableTableUpdateCompanionBuilder =
    HabitCompletionsTableCompanion Function({
      Value<String> id,
      Value<String> habitId,
      Value<HabitCompletionType> type,
      Value<DateTime> completedDate,
      Value<int> rowid,
    });

final class $$HabitCompletionsTableTableReferences
    extends
        BaseReferences<
          _$NotZeroDatabase,
          $HabitCompletionsTableTable,
          HabitCompletion
        > {
  $$HabitCompletionsTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $HabitsTableTable _habitIdTable(_$NotZeroDatabase db) =>
      db.habitsTable.createAlias(
        $_aliasNameGenerator(
          db.habitCompletionsTable.habitId,
          db.habitsTable.id,
        ),
      );

  $$HabitsTableTableProcessedTableManager get habitId {
    final $_column = $_itemColumn<String>('habit_id')!;

    final manager = $$HabitsTableTableTableManager(
      $_db,
      $_db.habitsTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_habitIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$HabitCompletionsTableTableFilterComposer
    extends Composer<_$NotZeroDatabase, $HabitCompletionsTableTable> {
  $$HabitCompletionsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<HabitCompletionType, HabitCompletionType, int>
  get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<DateTime, DateTime, String>
  get completedDate => $composableBuilder(
    column: $table.completedDate,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  $$HabitsTableTableFilterComposer get habitId {
    final $$HabitsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.habitId,
      referencedTable: $db.habitsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HabitsTableTableFilterComposer(
            $db: $db,
            $table: $db.habitsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HabitCompletionsTableTableOrderingComposer
    extends Composer<_$NotZeroDatabase, $HabitCompletionsTableTable> {
  $$HabitCompletionsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get completedDate => $composableBuilder(
    column: $table.completedDate,
    builder: (column) => ColumnOrderings(column),
  );

  $$HabitsTableTableOrderingComposer get habitId {
    final $$HabitsTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.habitId,
      referencedTable: $db.habitsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HabitsTableTableOrderingComposer(
            $db: $db,
            $table: $db.habitsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HabitCompletionsTableTableAnnotationComposer
    extends Composer<_$NotZeroDatabase, $HabitCompletionsTableTable> {
  $$HabitCompletionsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<HabitCompletionType, int> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumnWithTypeConverter<DateTime, String> get completedDate =>
      $composableBuilder(
        column: $table.completedDate,
        builder: (column) => column,
      );

  $$HabitsTableTableAnnotationComposer get habitId {
    final $$HabitsTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.habitId,
      referencedTable: $db.habitsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HabitsTableTableAnnotationComposer(
            $db: $db,
            $table: $db.habitsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HabitCompletionsTableTableTableManager
    extends
        RootTableManager<
          _$NotZeroDatabase,
          $HabitCompletionsTableTable,
          HabitCompletion,
          $$HabitCompletionsTableTableFilterComposer,
          $$HabitCompletionsTableTableOrderingComposer,
          $$HabitCompletionsTableTableAnnotationComposer,
          $$HabitCompletionsTableTableCreateCompanionBuilder,
          $$HabitCompletionsTableTableUpdateCompanionBuilder,
          (HabitCompletion, $$HabitCompletionsTableTableReferences),
          HabitCompletion,
          PrefetchHooks Function({bool habitId})
        > {
  $$HabitCompletionsTableTableTableManager(
    _$NotZeroDatabase db,
    $HabitCompletionsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HabitCompletionsTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$HabitCompletionsTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$HabitCompletionsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> habitId = const Value.absent(),
                Value<HabitCompletionType> type = const Value.absent(),
                Value<DateTime> completedDate = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => HabitCompletionsTableCompanion(
                id: id,
                habitId: habitId,
                type: type,
                completedDate: completedDate,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String habitId,
                required HabitCompletionType type,
                required DateTime completedDate,
                Value<int> rowid = const Value.absent(),
              }) => HabitCompletionsTableCompanion.insert(
                id: id,
                habitId: habitId,
                type: type,
                completedDate: completedDate,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$HabitCompletionsTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({habitId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
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
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (habitId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.habitId,
                                referencedTable:
                                    $$HabitCompletionsTableTableReferences
                                        ._habitIdTable(db),
                                referencedColumn:
                                    $$HabitCompletionsTableTableReferences
                                        ._habitIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$HabitCompletionsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$NotZeroDatabase,
      $HabitCompletionsTableTable,
      HabitCompletion,
      $$HabitCompletionsTableTableFilterComposer,
      $$HabitCompletionsTableTableOrderingComposer,
      $$HabitCompletionsTableTableAnnotationComposer,
      $$HabitCompletionsTableTableCreateCompanionBuilder,
      $$HabitCompletionsTableTableUpdateCompanionBuilder,
      (HabitCompletion, $$HabitCompletionsTableTableReferences),
      HabitCompletion,
      PrefetchHooks Function({bool habitId})
    >;
typedef $$HabitsTagEntriesTableCreateCompanionBuilder =
    HabitsTagEntriesCompanion Function({
      required String habit,
      required String tag,
      Value<int> rowid,
    });
typedef $$HabitsTagEntriesTableUpdateCompanionBuilder =
    HabitsTagEntriesCompanion Function({
      Value<String> habit,
      Value<String> tag,
      Value<int> rowid,
    });

final class $$HabitsTagEntriesTableReferences
    extends
        BaseReferences<
          _$NotZeroDatabase,
          $HabitsTagEntriesTable,
          HabitsTagEntry
        > {
  $$HabitsTagEntriesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $HabitsTableTable _habitTable(_$NotZeroDatabase db) =>
      db.habitsTable.createAlias(
        $_aliasNameGenerator(db.habitsTagEntries.habit, db.habitsTable.id),
      );

  $$HabitsTableTableProcessedTableManager get habit {
    final $_column = $_itemColumn<String>('habit')!;

    final manager = $$HabitsTableTableTableManager(
      $_db,
      $_db.habitsTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_habitTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $TagsTableTable _tagTable(_$NotZeroDatabase db) =>
      db.tagsTable.createAlias(
        $_aliasNameGenerator(db.habitsTagEntries.tag, db.tagsTable.id),
      );

  $$TagsTableTableProcessedTableManager get tag {
    final $_column = $_itemColumn<String>('tag')!;

    final manager = $$TagsTableTableTableManager(
      $_db,
      $_db.tagsTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_tagTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$HabitsTagEntriesTableFilterComposer
    extends Composer<_$NotZeroDatabase, $HabitsTagEntriesTable> {
  $$HabitsTagEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$HabitsTableTableFilterComposer get habit {
    final $$HabitsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.habit,
      referencedTable: $db.habitsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HabitsTableTableFilterComposer(
            $db: $db,
            $table: $db.habitsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TagsTableTableFilterComposer get tag {
    final $$TagsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tag,
      referencedTable: $db.tagsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TagsTableTableFilterComposer(
            $db: $db,
            $table: $db.tagsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HabitsTagEntriesTableOrderingComposer
    extends Composer<_$NotZeroDatabase, $HabitsTagEntriesTable> {
  $$HabitsTagEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$HabitsTableTableOrderingComposer get habit {
    final $$HabitsTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.habit,
      referencedTable: $db.habitsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HabitsTableTableOrderingComposer(
            $db: $db,
            $table: $db.habitsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TagsTableTableOrderingComposer get tag {
    final $$TagsTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tag,
      referencedTable: $db.tagsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TagsTableTableOrderingComposer(
            $db: $db,
            $table: $db.tagsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HabitsTagEntriesTableAnnotationComposer
    extends Composer<_$NotZeroDatabase, $HabitsTagEntriesTable> {
  $$HabitsTagEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$HabitsTableTableAnnotationComposer get habit {
    final $$HabitsTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.habit,
      referencedTable: $db.habitsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HabitsTableTableAnnotationComposer(
            $db: $db,
            $table: $db.habitsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TagsTableTableAnnotationComposer get tag {
    final $$TagsTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tag,
      referencedTable: $db.tagsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TagsTableTableAnnotationComposer(
            $db: $db,
            $table: $db.tagsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HabitsTagEntriesTableTableManager
    extends
        RootTableManager<
          _$NotZeroDatabase,
          $HabitsTagEntriesTable,
          HabitsTagEntry,
          $$HabitsTagEntriesTableFilterComposer,
          $$HabitsTagEntriesTableOrderingComposer,
          $$HabitsTagEntriesTableAnnotationComposer,
          $$HabitsTagEntriesTableCreateCompanionBuilder,
          $$HabitsTagEntriesTableUpdateCompanionBuilder,
          (HabitsTagEntry, $$HabitsTagEntriesTableReferences),
          HabitsTagEntry,
          PrefetchHooks Function({bool habit, bool tag})
        > {
  $$HabitsTagEntriesTableTableManager(
    _$NotZeroDatabase db,
    $HabitsTagEntriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HabitsTagEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HabitsTagEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HabitsTagEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> habit = const Value.absent(),
                Value<String> tag = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => HabitsTagEntriesCompanion(
                habit: habit,
                tag: tag,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String habit,
                required String tag,
                Value<int> rowid = const Value.absent(),
              }) => HabitsTagEntriesCompanion.insert(
                habit: habit,
                tag: tag,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$HabitsTagEntriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({habit = false, tag = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
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
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (habit) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.habit,
                                referencedTable:
                                    $$HabitsTagEntriesTableReferences
                                        ._habitTable(db),
                                referencedColumn:
                                    $$HabitsTagEntriesTableReferences
                                        ._habitTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (tag) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.tag,
                                referencedTable:
                                    $$HabitsTagEntriesTableReferences._tagTable(
                                      db,
                                    ),
                                referencedColumn:
                                    $$HabitsTagEntriesTableReferences
                                        ._tagTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$HabitsTagEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$NotZeroDatabase,
      $HabitsTagEntriesTable,
      HabitsTagEntry,
      $$HabitsTagEntriesTableFilterComposer,
      $$HabitsTagEntriesTableOrderingComposer,
      $$HabitsTagEntriesTableAnnotationComposer,
      $$HabitsTagEntriesTableCreateCompanionBuilder,
      $$HabitsTagEntriesTableUpdateCompanionBuilder,
      (HabitsTagEntry, $$HabitsTagEntriesTableReferences),
      HabitsTagEntry,
      PrefetchHooks Function({bool habit, bool tag})
    >;

class $NotZeroDatabaseManager {
  final _$NotZeroDatabase _db;
  $NotZeroDatabaseManager(this._db);
  $$TasksTableTableTableManager get tasksTable =>
      $$TasksTableTableTableManager(_db, _db.tasksTable);
  $$TagsTableTableTableManager get tagsTable =>
      $$TagsTableTableTableManager(_db, _db.tagsTable);
  $$TasksTagEntriesTableTableManager get tasksTagEntries =>
      $$TasksTagEntriesTableTableManager(_db, _db.tasksTagEntries);
  $$HabitsTableTableTableManager get habitsTable =>
      $$HabitsTableTableTableManager(_db, _db.habitsTable);
  $$HabitCompletionsTableTableTableManager get habitCompletionsTable =>
      $$HabitCompletionsTableTableTableManager(_db, _db.habitCompletionsTable);
  $$HabitsTagEntriesTableTableManager get habitsTagEntries =>
      $$HabitsTagEntriesTableTableManager(_db, _db.habitsTagEntries);
}
