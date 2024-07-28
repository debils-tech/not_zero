// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_plan_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DailyPlanModel _$DailyPlanModelFromJson(Map<String, dynamic> json) {
  return _DailyPlanModel.fromJson(json);
}

/// @nodoc
mixin _$DailyPlanModel {
  String get id => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  DateTime get forDate => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;
  bool get persistent => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DailyPlanModelCopyWith<DailyPlanModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyPlanModelCopyWith<$Res> {
  factory $DailyPlanModelCopyWith(
          DailyPlanModel value, $Res Function(DailyPlanModel) then) =
      _$DailyPlanModelCopyWithImpl<$Res, DailyPlanModel>;
  @useResult
  $Res call(
      {String id,
      DateTime createdAt,
      DateTime updatedAt,
      DateTime forDate,
      String title,
      String description,
      DateTime? completedAt,
      bool persistent});
}

/// @nodoc
class _$DailyPlanModelCopyWithImpl<$Res, $Val extends DailyPlanModel>
    implements $DailyPlanModelCopyWith<$Res> {
  _$DailyPlanModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? forDate = null,
    Object? title = null,
    Object? description = null,
    Object? completedAt = freezed,
    Object? persistent = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      forDate: null == forDate
          ? _value.forDate
          : forDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      persistent: null == persistent
          ? _value.persistent
          : persistent // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DailyPlanModelImplCopyWith<$Res>
    implements $DailyPlanModelCopyWith<$Res> {
  factory _$$DailyPlanModelImplCopyWith(_$DailyPlanModelImpl value,
          $Res Function(_$DailyPlanModelImpl) then) =
      __$$DailyPlanModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DateTime createdAt,
      DateTime updatedAt,
      DateTime forDate,
      String title,
      String description,
      DateTime? completedAt,
      bool persistent});
}

/// @nodoc
class __$$DailyPlanModelImplCopyWithImpl<$Res>
    extends _$DailyPlanModelCopyWithImpl<$Res, _$DailyPlanModelImpl>
    implements _$$DailyPlanModelImplCopyWith<$Res> {
  __$$DailyPlanModelImplCopyWithImpl(
      _$DailyPlanModelImpl _value, $Res Function(_$DailyPlanModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? forDate = null,
    Object? title = null,
    Object? description = null,
    Object? completedAt = freezed,
    Object? persistent = null,
  }) {
    return _then(_$DailyPlanModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      forDate: null == forDate
          ? _value.forDate
          : forDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      persistent: null == persistent
          ? _value.persistent
          : persistent // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$DailyPlanModelImpl implements _DailyPlanModel {
  const _$DailyPlanModelImpl(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.forDate,
      required this.title,
      this.description = '',
      this.completedAt,
      this.persistent = false});

  factory _$DailyPlanModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyPlanModelImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final DateTime forDate;
  @override
  final String title;
  @override
  @JsonKey()
  final String description;
  @override
  final DateTime? completedAt;
  @override
  @JsonKey()
  final bool persistent;

  @override
  String toString() {
    return 'DailyPlanModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, forDate: $forDate, title: $title, description: $description, completedAt: $completedAt, persistent: $persistent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyPlanModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.forDate, forDate) || other.forDate == forDate) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.persistent, persistent) ||
                other.persistent == persistent));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, createdAt, updatedAt,
      forDate, title, description, completedAt, persistent);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyPlanModelImplCopyWith<_$DailyPlanModelImpl> get copyWith =>
      __$$DailyPlanModelImplCopyWithImpl<_$DailyPlanModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyPlanModelImplToJson(
      this,
    );
  }
}

abstract class _DailyPlanModel implements DailyPlanModel {
  const factory _DailyPlanModel(
      {required final String id,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      required final DateTime forDate,
      required final String title,
      final String description,
      final DateTime? completedAt,
      final bool persistent}) = _$DailyPlanModelImpl;

  factory _DailyPlanModel.fromJson(Map<String, dynamic> json) =
      _$DailyPlanModelImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  DateTime get forDate;
  @override
  String get title;
  @override
  String get description;
  @override
  DateTime? get completedAt;
  @override
  bool get persistent;
  @override
  @JsonKey(ignore: true)
  _$$DailyPlanModelImplCopyWith<_$DailyPlanModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DailyPlanModelInsert _$DailyPlanModelInsertFromJson(Map<String, dynamic> json) {
  return _DailyPlanModelInsert.fromJson(json);
}

/// @nodoc
mixin _$DailyPlanModelInsert {
  String get userId => throw _privateConstructorUsedError;
  DateTime get forDate => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;
  bool get persistent => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DailyPlanModelInsertCopyWith<DailyPlanModelInsert> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyPlanModelInsertCopyWith<$Res> {
  factory $DailyPlanModelInsertCopyWith(DailyPlanModelInsert value,
          $Res Function(DailyPlanModelInsert) then) =
      _$DailyPlanModelInsertCopyWithImpl<$Res, DailyPlanModelInsert>;
  @useResult
  $Res call(
      {String userId,
      DateTime forDate,
      String title,
      String description,
      DateTime? completedAt,
      bool persistent});
}

/// @nodoc
class _$DailyPlanModelInsertCopyWithImpl<$Res,
        $Val extends DailyPlanModelInsert>
    implements $DailyPlanModelInsertCopyWith<$Res> {
  _$DailyPlanModelInsertCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? forDate = null,
    Object? title = null,
    Object? description = null,
    Object? completedAt = freezed,
    Object? persistent = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      forDate: null == forDate
          ? _value.forDate
          : forDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      persistent: null == persistent
          ? _value.persistent
          : persistent // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DailyPlanModelInsertImplCopyWith<$Res>
    implements $DailyPlanModelInsertCopyWith<$Res> {
  factory _$$DailyPlanModelInsertImplCopyWith(_$DailyPlanModelInsertImpl value,
          $Res Function(_$DailyPlanModelInsertImpl) then) =
      __$$DailyPlanModelInsertImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      DateTime forDate,
      String title,
      String description,
      DateTime? completedAt,
      bool persistent});
}

/// @nodoc
class __$$DailyPlanModelInsertImplCopyWithImpl<$Res>
    extends _$DailyPlanModelInsertCopyWithImpl<$Res, _$DailyPlanModelInsertImpl>
    implements _$$DailyPlanModelInsertImplCopyWith<$Res> {
  __$$DailyPlanModelInsertImplCopyWithImpl(_$DailyPlanModelInsertImpl _value,
      $Res Function(_$DailyPlanModelInsertImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? forDate = null,
    Object? title = null,
    Object? description = null,
    Object? completedAt = freezed,
    Object? persistent = null,
  }) {
    return _then(_$DailyPlanModelInsertImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      forDate: null == forDate
          ? _value.forDate
          : forDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      persistent: null == persistent
          ? _value.persistent
          : persistent // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$DailyPlanModelInsertImpl implements _DailyPlanModelInsert {
  const _$DailyPlanModelInsertImpl(
      {required this.userId,
      required this.forDate,
      required this.title,
      this.description = '',
      this.completedAt,
      this.persistent = false});

  factory _$DailyPlanModelInsertImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyPlanModelInsertImplFromJson(json);

  @override
  final String userId;
  @override
  final DateTime forDate;
  @override
  final String title;
  @override
  @JsonKey()
  final String description;
  @override
  final DateTime? completedAt;
  @override
  @JsonKey()
  final bool persistent;

  @override
  String toString() {
    return 'DailyPlanModelInsert(userId: $userId, forDate: $forDate, title: $title, description: $description, completedAt: $completedAt, persistent: $persistent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyPlanModelInsertImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.forDate, forDate) || other.forDate == forDate) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.persistent, persistent) ||
                other.persistent == persistent));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, forDate, title,
      description, completedAt, persistent);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyPlanModelInsertImplCopyWith<_$DailyPlanModelInsertImpl>
      get copyWith =>
          __$$DailyPlanModelInsertImplCopyWithImpl<_$DailyPlanModelInsertImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyPlanModelInsertImplToJson(
      this,
    );
  }
}

abstract class _DailyPlanModelInsert implements DailyPlanModelInsert {
  const factory _DailyPlanModelInsert(
      {required final String userId,
      required final DateTime forDate,
      required final String title,
      final String description,
      final DateTime? completedAt,
      final bool persistent}) = _$DailyPlanModelInsertImpl;

  factory _DailyPlanModelInsert.fromJson(Map<String, dynamic> json) =
      _$DailyPlanModelInsertImpl.fromJson;

  @override
  String get userId;
  @override
  DateTime get forDate;
  @override
  String get title;
  @override
  String get description;
  @override
  DateTime? get completedAt;
  @override
  bool get persistent;
  @override
  @JsonKey(ignore: true)
  _$$DailyPlanModelInsertImplCopyWith<_$DailyPlanModelInsertImpl>
      get copyWith => throw _privateConstructorUsedError;
}
