// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TaskAction {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskAction);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TaskAction()';
}


}

/// @nodoc
class $TaskActionCopyWith<$Res>  {
$TaskActionCopyWith(TaskAction _, $Res Function(TaskAction) __);
}


/// Adds pattern-matching-related methods to [TaskAction].
extension TaskActionPatterns on TaskAction {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TaskActionCreated value)?  created,TResult Function( TaskActionUpdated value)?  updated,TResult Function( TaskActionDeletedMultiple value)?  deleted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TaskActionCreated() when created != null:
return created(_that);case TaskActionUpdated() when updated != null:
return updated(_that);case TaskActionDeletedMultiple() when deleted != null:
return deleted(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TaskActionCreated value)  created,required TResult Function( TaskActionUpdated value)  updated,required TResult Function( TaskActionDeletedMultiple value)  deleted,}){
final _that = this;
switch (_that) {
case TaskActionCreated():
return created(_that);case TaskActionUpdated():
return updated(_that);case TaskActionDeletedMultiple():
return deleted(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TaskActionCreated value)?  created,TResult? Function( TaskActionUpdated value)?  updated,TResult? Function( TaskActionDeletedMultiple value)?  deleted,}){
final _that = this;
switch (_that) {
case TaskActionCreated() when created != null:
return created(_that);case TaskActionUpdated() when updated != null:
return updated(_that);case TaskActionDeletedMultiple() when deleted != null:
return deleted(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Task task)?  created,TResult Function( Task oldTask,  Task newTask)?  updated,TResult Function( Iterable<Task> tasks)?  deleted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TaskActionCreated() when created != null:
return created(_that.task);case TaskActionUpdated() when updated != null:
return updated(_that.oldTask,_that.newTask);case TaskActionDeletedMultiple() when deleted != null:
return deleted(_that.tasks);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Task task)  created,required TResult Function( Task oldTask,  Task newTask)  updated,required TResult Function( Iterable<Task> tasks)  deleted,}) {final _that = this;
switch (_that) {
case TaskActionCreated():
return created(_that.task);case TaskActionUpdated():
return updated(_that.oldTask,_that.newTask);case TaskActionDeletedMultiple():
return deleted(_that.tasks);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Task task)?  created,TResult? Function( Task oldTask,  Task newTask)?  updated,TResult? Function( Iterable<Task> tasks)?  deleted,}) {final _that = this;
switch (_that) {
case TaskActionCreated() when created != null:
return created(_that.task);case TaskActionUpdated() when updated != null:
return updated(_that.oldTask,_that.newTask);case TaskActionDeletedMultiple() when deleted != null:
return deleted(_that.tasks);case _:
  return null;

}
}

}

/// @nodoc


class TaskActionCreated extends TaskAction {
  const TaskActionCreated({required this.task}): super._();
  

 final  Task task;

/// Create a copy of TaskAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskActionCreatedCopyWith<TaskActionCreated> get copyWith => _$TaskActionCreatedCopyWithImpl<TaskActionCreated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskActionCreated&&(identical(other.task, task) || other.task == task));
}


@override
int get hashCode => Object.hash(runtimeType,task);

@override
String toString() {
  return 'TaskAction.created(task: $task)';
}


}

/// @nodoc
abstract mixin class $TaskActionCreatedCopyWith<$Res> implements $TaskActionCopyWith<$Res> {
  factory $TaskActionCreatedCopyWith(TaskActionCreated value, $Res Function(TaskActionCreated) _then) = _$TaskActionCreatedCopyWithImpl;
@useResult
$Res call({
 Task task
});


$TaskCopyWith<$Res> get task;

}
/// @nodoc
class _$TaskActionCreatedCopyWithImpl<$Res>
    implements $TaskActionCreatedCopyWith<$Res> {
  _$TaskActionCreatedCopyWithImpl(this._self, this._then);

  final TaskActionCreated _self;
  final $Res Function(TaskActionCreated) _then;

/// Create a copy of TaskAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? task = null,}) {
  return _then(TaskActionCreated(
task: null == task ? _self.task : task // ignore: cast_nullable_to_non_nullable
as Task,
  ));
}

/// Create a copy of TaskAction
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TaskCopyWith<$Res> get task {
  
  return $TaskCopyWith<$Res>(_self.task, (value) {
    return _then(_self.copyWith(task: value));
  });
}
}

/// @nodoc


class TaskActionUpdated extends TaskAction {
  const TaskActionUpdated({required this.oldTask, required this.newTask}): super._();
  

 final  Task oldTask;
 final  Task newTask;

/// Create a copy of TaskAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskActionUpdatedCopyWith<TaskActionUpdated> get copyWith => _$TaskActionUpdatedCopyWithImpl<TaskActionUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskActionUpdated&&(identical(other.oldTask, oldTask) || other.oldTask == oldTask)&&(identical(other.newTask, newTask) || other.newTask == newTask));
}


@override
int get hashCode => Object.hash(runtimeType,oldTask,newTask);

@override
String toString() {
  return 'TaskAction.updated(oldTask: $oldTask, newTask: $newTask)';
}


}

/// @nodoc
abstract mixin class $TaskActionUpdatedCopyWith<$Res> implements $TaskActionCopyWith<$Res> {
  factory $TaskActionUpdatedCopyWith(TaskActionUpdated value, $Res Function(TaskActionUpdated) _then) = _$TaskActionUpdatedCopyWithImpl;
@useResult
$Res call({
 Task oldTask, Task newTask
});


$TaskCopyWith<$Res> get oldTask;$TaskCopyWith<$Res> get newTask;

}
/// @nodoc
class _$TaskActionUpdatedCopyWithImpl<$Res>
    implements $TaskActionUpdatedCopyWith<$Res> {
  _$TaskActionUpdatedCopyWithImpl(this._self, this._then);

  final TaskActionUpdated _self;
  final $Res Function(TaskActionUpdated) _then;

/// Create a copy of TaskAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? oldTask = null,Object? newTask = null,}) {
  return _then(TaskActionUpdated(
oldTask: null == oldTask ? _self.oldTask : oldTask // ignore: cast_nullable_to_non_nullable
as Task,newTask: null == newTask ? _self.newTask : newTask // ignore: cast_nullable_to_non_nullable
as Task,
  ));
}

/// Create a copy of TaskAction
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TaskCopyWith<$Res> get oldTask {
  
  return $TaskCopyWith<$Res>(_self.oldTask, (value) {
    return _then(_self.copyWith(oldTask: value));
  });
}/// Create a copy of TaskAction
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TaskCopyWith<$Res> get newTask {
  
  return $TaskCopyWith<$Res>(_self.newTask, (value) {
    return _then(_self.copyWith(newTask: value));
  });
}
}

/// @nodoc


class TaskActionDeletedMultiple extends TaskAction {
  const TaskActionDeletedMultiple({required this.tasks}): super._();
  

 final  Iterable<Task> tasks;

/// Create a copy of TaskAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskActionDeletedMultipleCopyWith<TaskActionDeletedMultiple> get copyWith => _$TaskActionDeletedMultipleCopyWithImpl<TaskActionDeletedMultiple>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskActionDeletedMultiple&&const DeepCollectionEquality().equals(other.tasks, tasks));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(tasks));

@override
String toString() {
  return 'TaskAction.deleted(tasks: $tasks)';
}


}

/// @nodoc
abstract mixin class $TaskActionDeletedMultipleCopyWith<$Res> implements $TaskActionCopyWith<$Res> {
  factory $TaskActionDeletedMultipleCopyWith(TaskActionDeletedMultiple value, $Res Function(TaskActionDeletedMultiple) _then) = _$TaskActionDeletedMultipleCopyWithImpl;
@useResult
$Res call({
 Iterable<Task> tasks
});




}
/// @nodoc
class _$TaskActionDeletedMultipleCopyWithImpl<$Res>
    implements $TaskActionDeletedMultipleCopyWith<$Res> {
  _$TaskActionDeletedMultipleCopyWithImpl(this._self, this._then);

  final TaskActionDeletedMultiple _self;
  final $Res Function(TaskActionDeletedMultiple) _then;

/// Create a copy of TaskAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tasks = null,}) {
  return _then(TaskActionDeletedMultiple(
tasks: null == tasks ? _self.tasks : tasks // ignore: cast_nullable_to_non_nullable
as Iterable<Task>,
  ));
}


}

// dart format on
