// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'habit_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HabitAction {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HabitAction);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HabitAction()';
}


}

/// @nodoc
class $HabitActionCopyWith<$Res>  {
$HabitActionCopyWith(HabitAction _, $Res Function(HabitAction) __);
}



/// @nodoc


class HabitActionCreated extends HabitAction {
  const HabitActionCreated({required this.habit}): super._();
  

 final  Habit habit;

/// Create a copy of HabitAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HabitActionCreatedCopyWith<HabitActionCreated> get copyWith => _$HabitActionCreatedCopyWithImpl<HabitActionCreated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HabitActionCreated&&(identical(other.habit, habit) || other.habit == habit));
}


@override
int get hashCode => Object.hash(runtimeType,habit);

@override
String toString() {
  return 'HabitAction.created(habit: $habit)';
}


}

/// @nodoc
abstract mixin class $HabitActionCreatedCopyWith<$Res> implements $HabitActionCopyWith<$Res> {
  factory $HabitActionCreatedCopyWith(HabitActionCreated value, $Res Function(HabitActionCreated) _then) = _$HabitActionCreatedCopyWithImpl;
@useResult
$Res call({
 Habit habit
});


$HabitCopyWith<$Res> get habit;

}
/// @nodoc
class _$HabitActionCreatedCopyWithImpl<$Res>
    implements $HabitActionCreatedCopyWith<$Res> {
  _$HabitActionCreatedCopyWithImpl(this._self, this._then);

  final HabitActionCreated _self;
  final $Res Function(HabitActionCreated) _then;

/// Create a copy of HabitAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? habit = null,}) {
  return _then(HabitActionCreated(
habit: null == habit ? _self.habit : habit // ignore: cast_nullable_to_non_nullable
as Habit,
  ));
}

/// Create a copy of HabitAction
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HabitCopyWith<$Res> get habit {
  
  return $HabitCopyWith<$Res>(_self.habit, (value) {
    return _then(_self.copyWith(habit: value));
  });
}
}

/// @nodoc


class HabitActionUpdated extends HabitAction {
  const HabitActionUpdated({required this.oldHabit, required this.newHabit}): super._();
  

 final  Habit oldHabit;
 final  Habit newHabit;

/// Create a copy of HabitAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HabitActionUpdatedCopyWith<HabitActionUpdated> get copyWith => _$HabitActionUpdatedCopyWithImpl<HabitActionUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HabitActionUpdated&&(identical(other.oldHabit, oldHabit) || other.oldHabit == oldHabit)&&(identical(other.newHabit, newHabit) || other.newHabit == newHabit));
}


@override
int get hashCode => Object.hash(runtimeType,oldHabit,newHabit);

@override
String toString() {
  return 'HabitAction.updated(oldHabit: $oldHabit, newHabit: $newHabit)';
}


}

/// @nodoc
abstract mixin class $HabitActionUpdatedCopyWith<$Res> implements $HabitActionCopyWith<$Res> {
  factory $HabitActionUpdatedCopyWith(HabitActionUpdated value, $Res Function(HabitActionUpdated) _then) = _$HabitActionUpdatedCopyWithImpl;
@useResult
$Res call({
 Habit oldHabit, Habit newHabit
});


$HabitCopyWith<$Res> get oldHabit;$HabitCopyWith<$Res> get newHabit;

}
/// @nodoc
class _$HabitActionUpdatedCopyWithImpl<$Res>
    implements $HabitActionUpdatedCopyWith<$Res> {
  _$HabitActionUpdatedCopyWithImpl(this._self, this._then);

  final HabitActionUpdated _self;
  final $Res Function(HabitActionUpdated) _then;

/// Create a copy of HabitAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? oldHabit = null,Object? newHabit = null,}) {
  return _then(HabitActionUpdated(
oldHabit: null == oldHabit ? _self.oldHabit : oldHabit // ignore: cast_nullable_to_non_nullable
as Habit,newHabit: null == newHabit ? _self.newHabit : newHabit // ignore: cast_nullable_to_non_nullable
as Habit,
  ));
}

/// Create a copy of HabitAction
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HabitCopyWith<$Res> get oldHabit {
  
  return $HabitCopyWith<$Res>(_self.oldHabit, (value) {
    return _then(_self.copyWith(oldHabit: value));
  });
}/// Create a copy of HabitAction
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HabitCopyWith<$Res> get newHabit {
  
  return $HabitCopyWith<$Res>(_self.newHabit, (value) {
    return _then(_self.copyWith(newHabit: value));
  });
}
}

/// @nodoc


class HabitActionDeletedMultiple extends HabitAction {
  const HabitActionDeletedMultiple({required this.habits}): super._();
  

 final  Iterable<Habit> habits;

/// Create a copy of HabitAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HabitActionDeletedMultipleCopyWith<HabitActionDeletedMultiple> get copyWith => _$HabitActionDeletedMultipleCopyWithImpl<HabitActionDeletedMultiple>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HabitActionDeletedMultiple&&const DeepCollectionEquality().equals(other.habits, habits));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(habits));

@override
String toString() {
  return 'HabitAction.deleted(habits: $habits)';
}


}

/// @nodoc
abstract mixin class $HabitActionDeletedMultipleCopyWith<$Res> implements $HabitActionCopyWith<$Res> {
  factory $HabitActionDeletedMultipleCopyWith(HabitActionDeletedMultiple value, $Res Function(HabitActionDeletedMultiple) _then) = _$HabitActionDeletedMultipleCopyWithImpl;
@useResult
$Res call({
 Iterable<Habit> habits
});




}
/// @nodoc
class _$HabitActionDeletedMultipleCopyWithImpl<$Res>
    implements $HabitActionDeletedMultipleCopyWith<$Res> {
  _$HabitActionDeletedMultipleCopyWithImpl(this._self, this._then);

  final HabitActionDeletedMultiple _self;
  final $Res Function(HabitActionDeletedMultiple) _then;

/// Create a copy of HabitAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? habits = null,}) {
  return _then(HabitActionDeletedMultiple(
habits: null == habits ? _self.habits : habits // ignore: cast_nullable_to_non_nullable
as Iterable<Habit>,
  ));
}


}

/// @nodoc


class HabitActionCompleted extends HabitAction {
  const HabitActionCompleted({required this.habit, required this.completion}): super._();
  

 final  Habit habit;
 final  HabitCompletion completion;

/// Create a copy of HabitAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HabitActionCompletedCopyWith<HabitActionCompleted> get copyWith => _$HabitActionCompletedCopyWithImpl<HabitActionCompleted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HabitActionCompleted&&(identical(other.habit, habit) || other.habit == habit)&&(identical(other.completion, completion) || other.completion == completion));
}


@override
int get hashCode => Object.hash(runtimeType,habit,completion);

@override
String toString() {
  return 'HabitAction.completed(habit: $habit, completion: $completion)';
}


}

/// @nodoc
abstract mixin class $HabitActionCompletedCopyWith<$Res> implements $HabitActionCopyWith<$Res> {
  factory $HabitActionCompletedCopyWith(HabitActionCompleted value, $Res Function(HabitActionCompleted) _then) = _$HabitActionCompletedCopyWithImpl;
@useResult
$Res call({
 Habit habit, HabitCompletion completion
});


$HabitCopyWith<$Res> get habit;$HabitCompletionCopyWith<$Res> get completion;

}
/// @nodoc
class _$HabitActionCompletedCopyWithImpl<$Res>
    implements $HabitActionCompletedCopyWith<$Res> {
  _$HabitActionCompletedCopyWithImpl(this._self, this._then);

  final HabitActionCompleted _self;
  final $Res Function(HabitActionCompleted) _then;

/// Create a copy of HabitAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? habit = null,Object? completion = null,}) {
  return _then(HabitActionCompleted(
habit: null == habit ? _self.habit : habit // ignore: cast_nullable_to_non_nullable
as Habit,completion: null == completion ? _self.completion : completion // ignore: cast_nullable_to_non_nullable
as HabitCompletion,
  ));
}

/// Create a copy of HabitAction
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HabitCopyWith<$Res> get habit {
  
  return $HabitCopyWith<$Res>(_self.habit, (value) {
    return _then(_self.copyWith(habit: value));
  });
}/// Create a copy of HabitAction
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HabitCompletionCopyWith<$Res> get completion {
  
  return $HabitCompletionCopyWith<$Res>(_self.completion, (value) {
    return _then(_self.copyWith(completion: value));
  });
}
}

/// @nodoc


class HabitActionNotCompleted extends HabitAction {
  const HabitActionNotCompleted({required this.habit, required this.completion}): super._();
  

 final  Habit habit;
 final  HabitCompletion completion;

/// Create a copy of HabitAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HabitActionNotCompletedCopyWith<HabitActionNotCompleted> get copyWith => _$HabitActionNotCompletedCopyWithImpl<HabitActionNotCompleted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HabitActionNotCompleted&&(identical(other.habit, habit) || other.habit == habit)&&(identical(other.completion, completion) || other.completion == completion));
}


@override
int get hashCode => Object.hash(runtimeType,habit,completion);

@override
String toString() {
  return 'HabitAction.notCompleted(habit: $habit, completion: $completion)';
}


}

/// @nodoc
abstract mixin class $HabitActionNotCompletedCopyWith<$Res> implements $HabitActionCopyWith<$Res> {
  factory $HabitActionNotCompletedCopyWith(HabitActionNotCompleted value, $Res Function(HabitActionNotCompleted) _then) = _$HabitActionNotCompletedCopyWithImpl;
@useResult
$Res call({
 Habit habit, HabitCompletion completion
});


$HabitCopyWith<$Res> get habit;$HabitCompletionCopyWith<$Res> get completion;

}
/// @nodoc
class _$HabitActionNotCompletedCopyWithImpl<$Res>
    implements $HabitActionNotCompletedCopyWith<$Res> {
  _$HabitActionNotCompletedCopyWithImpl(this._self, this._then);

  final HabitActionNotCompleted _self;
  final $Res Function(HabitActionNotCompleted) _then;

/// Create a copy of HabitAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? habit = null,Object? completion = null,}) {
  return _then(HabitActionNotCompleted(
habit: null == habit ? _self.habit : habit // ignore: cast_nullable_to_non_nullable
as Habit,completion: null == completion ? _self.completion : completion // ignore: cast_nullable_to_non_nullable
as HabitCompletion,
  ));
}

/// Create a copy of HabitAction
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HabitCopyWith<$Res> get habit {
  
  return $HabitCopyWith<$Res>(_self.habit, (value) {
    return _then(_self.copyWith(habit: value));
  });
}/// Create a copy of HabitAction
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HabitCompletionCopyWith<$Res> get completion {
  
  return $HabitCompletionCopyWith<$Res>(_self.completion, (value) {
    return _then(_self.copyWith(completion: value));
  });
}
}

// dart format on
