// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'global_stats_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GlobalStatsAction {
  GlobalStatsActionType get type => throw _privateConstructorUsedError;

  /// Create a copy of GlobalStatsAction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GlobalStatsActionCopyWith<GlobalStatsAction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GlobalStatsActionCopyWith<$Res> {
  factory $GlobalStatsActionCopyWith(
          GlobalStatsAction value, $Res Function(GlobalStatsAction) then) =
      _$GlobalStatsActionCopyWithImpl<$Res, GlobalStatsAction>;
  @useResult
  $Res call({GlobalStatsActionType type});
}

/// @nodoc
class _$GlobalStatsActionCopyWithImpl<$Res, $Val extends GlobalStatsAction>
    implements $GlobalStatsActionCopyWith<$Res> {
  _$GlobalStatsActionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GlobalStatsAction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as GlobalStatsActionType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GlobalStatsActionTaskCompletedImplCopyWith<$Res>
    implements $GlobalStatsActionCopyWith<$Res> {
  factory _$$GlobalStatsActionTaskCompletedImplCopyWith(
          _$GlobalStatsActionTaskCompletedImpl value,
          $Res Function(_$GlobalStatsActionTaskCompletedImpl) then) =
      __$$GlobalStatsActionTaskCompletedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Task task, GlobalStatsActionType type});

  $TaskCopyWith<$Res> get task;
}

/// @nodoc
class __$$GlobalStatsActionTaskCompletedImplCopyWithImpl<$Res>
    extends _$GlobalStatsActionCopyWithImpl<$Res,
        _$GlobalStatsActionTaskCompletedImpl>
    implements _$$GlobalStatsActionTaskCompletedImplCopyWith<$Res> {
  __$$GlobalStatsActionTaskCompletedImplCopyWithImpl(
      _$GlobalStatsActionTaskCompletedImpl _value,
      $Res Function(_$GlobalStatsActionTaskCompletedImpl) _then)
      : super(_value, _then);

  /// Create a copy of GlobalStatsAction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? task = null,
    Object? type = null,
  }) {
    return _then(_$GlobalStatsActionTaskCompletedImpl(
      task: null == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as Task,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as GlobalStatsActionType,
    ));
  }

  /// Create a copy of GlobalStatsAction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TaskCopyWith<$Res> get task {
    return $TaskCopyWith<$Res>(_value.task, (value) {
      return _then(_value.copyWith(task: value));
    });
  }
}

/// @nodoc

class _$GlobalStatsActionTaskCompletedImpl
    implements GlobalStatsActionTaskCompleted {
  const _$GlobalStatsActionTaskCompletedImpl(
      {required this.task, this.type = GlobalStatsActionType.taskCompleted});

  @override
  final Task task;
  @override
  @JsonKey()
  final GlobalStatsActionType type;

  @override
  String toString() {
    return 'GlobalStatsAction.taskCompleted(task: $task, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GlobalStatsActionTaskCompletedImpl &&
            (identical(other.task, task) || other.task == task) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, task, type);

  /// Create a copy of GlobalStatsAction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GlobalStatsActionTaskCompletedImplCopyWith<
          _$GlobalStatsActionTaskCompletedImpl>
      get copyWith => __$$GlobalStatsActionTaskCompletedImplCopyWithImpl<
          _$GlobalStatsActionTaskCompletedImpl>(this, _$identity);
}

abstract class GlobalStatsActionTaskCompleted implements GlobalStatsAction {
  const factory GlobalStatsActionTaskCompleted(
      {required final Task task,
      final GlobalStatsActionType type}) = _$GlobalStatsActionTaskCompletedImpl;

  Task get task;
  @override
  GlobalStatsActionType get type;

  /// Create a copy of GlobalStatsAction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GlobalStatsActionTaskCompletedImplCopyWith<
          _$GlobalStatsActionTaskCompletedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GlobalStatsActionAppLoginImplCopyWith<$Res>
    implements $GlobalStatsActionCopyWith<$Res> {
  factory _$$GlobalStatsActionAppLoginImplCopyWith(
          _$GlobalStatsActionAppLoginImpl value,
          $Res Function(_$GlobalStatsActionAppLoginImpl) then) =
      __$$GlobalStatsActionAppLoginImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime loginTime, GlobalStatsActionType type});
}

/// @nodoc
class __$$GlobalStatsActionAppLoginImplCopyWithImpl<$Res>
    extends _$GlobalStatsActionCopyWithImpl<$Res,
        _$GlobalStatsActionAppLoginImpl>
    implements _$$GlobalStatsActionAppLoginImplCopyWith<$Res> {
  __$$GlobalStatsActionAppLoginImplCopyWithImpl(
      _$GlobalStatsActionAppLoginImpl _value,
      $Res Function(_$GlobalStatsActionAppLoginImpl) _then)
      : super(_value, _then);

  /// Create a copy of GlobalStatsAction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginTime = null,
    Object? type = null,
  }) {
    return _then(_$GlobalStatsActionAppLoginImpl(
      loginTime: null == loginTime
          ? _value.loginTime
          : loginTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as GlobalStatsActionType,
    ));
  }
}

/// @nodoc

class _$GlobalStatsActionAppLoginImpl implements GlobalStatsActionAppLogin {
  const _$GlobalStatsActionAppLoginImpl(
      {required this.loginTime, this.type = GlobalStatsActionType.appLogin});

  @override
  final DateTime loginTime;
  @override
  @JsonKey()
  final GlobalStatsActionType type;

  @override
  String toString() {
    return 'GlobalStatsAction.appLogin(loginTime: $loginTime, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GlobalStatsActionAppLoginImpl &&
            (identical(other.loginTime, loginTime) ||
                other.loginTime == loginTime) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loginTime, type);

  /// Create a copy of GlobalStatsAction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GlobalStatsActionAppLoginImplCopyWith<_$GlobalStatsActionAppLoginImpl>
      get copyWith => __$$GlobalStatsActionAppLoginImplCopyWithImpl<
          _$GlobalStatsActionAppLoginImpl>(this, _$identity);
}

abstract class GlobalStatsActionAppLogin implements GlobalStatsAction {
  const factory GlobalStatsActionAppLogin(
      {required final DateTime loginTime,
      final GlobalStatsActionType type}) = _$GlobalStatsActionAppLoginImpl;

  DateTime get loginTime;
  @override
  GlobalStatsActionType get type;

  /// Create a copy of GlobalStatsAction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GlobalStatsActionAppLoginImplCopyWith<_$GlobalStatsActionAppLoginImpl>
      get copyWith => throw _privateConstructorUsedError;
}
