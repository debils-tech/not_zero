// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Task {

 String get id; String get title; TaskImportance get importance; DateTime get createdAt; String get description; DateTime? get modifiedAt; DateTime? get completedAt; DateTime? get canceledAt; DateTime? get forDate; bool get persistent;@JsonKey(toJson: Task._tagsToJson) List<ItemTag> get tags;
/// Create a copy of Task
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskCopyWith<Task> get copyWith => _$TaskCopyWithImpl<Task>(this as Task, _$identity);

  /// Serializes this Task to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Task&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.importance, importance) || other.importance == importance)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.description, description) || other.description == description)&&(identical(other.modifiedAt, modifiedAt) || other.modifiedAt == modifiedAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.canceledAt, canceledAt) || other.canceledAt == canceledAt)&&(identical(other.forDate, forDate) || other.forDate == forDate)&&(identical(other.persistent, persistent) || other.persistent == persistent)&&const DeepCollectionEquality().equals(other.tags, tags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,importance,createdAt,description,modifiedAt,completedAt,canceledAt,forDate,persistent,const DeepCollectionEquality().hash(tags));

@override
String toString() {
  return 'Task(id: $id, title: $title, importance: $importance, createdAt: $createdAt, description: $description, modifiedAt: $modifiedAt, completedAt: $completedAt, canceledAt: $canceledAt, forDate: $forDate, persistent: $persistent, tags: $tags)';
}


}

/// @nodoc
abstract mixin class $TaskCopyWith<$Res>  {
  factory $TaskCopyWith(Task value, $Res Function(Task) _then) = _$TaskCopyWithImpl;
@useResult
$Res call({
 String id, String title, TaskImportance importance, DateTime createdAt, String description, DateTime? modifiedAt, DateTime? completedAt, DateTime? canceledAt, DateTime? forDate, bool persistent,@JsonKey(toJson: Task._tagsToJson) List<ItemTag> tags
});




}
/// @nodoc
class _$TaskCopyWithImpl<$Res>
    implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._self, this._then);

  final Task _self;
  final $Res Function(Task) _then;

/// Create a copy of Task
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? importance = null,Object? createdAt = null,Object? description = null,Object? modifiedAt = freezed,Object? completedAt = freezed,Object? canceledAt = freezed,Object? forDate = freezed,Object? persistent = null,Object? tags = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,importance: null == importance ? _self.importance : importance // ignore: cast_nullable_to_non_nullable
as TaskImportance,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,modifiedAt: freezed == modifiedAt ? _self.modifiedAt : modifiedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,canceledAt: freezed == canceledAt ? _self.canceledAt : canceledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,forDate: freezed == forDate ? _self.forDate : forDate // ignore: cast_nullable_to_non_nullable
as DateTime?,persistent: null == persistent ? _self.persistent : persistent // ignore: cast_nullable_to_non_nullable
as bool,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<ItemTag>,
  ));
}

}


/// Adds pattern-matching-related methods to [Task].
extension TaskPatterns on Task {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Task value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Task() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Task value)  $default,){
final _that = this;
switch (_that) {
case _Task():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Task value)?  $default,){
final _that = this;
switch (_that) {
case _Task() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  TaskImportance importance,  DateTime createdAt,  String description,  DateTime? modifiedAt,  DateTime? completedAt,  DateTime? canceledAt,  DateTime? forDate,  bool persistent, @JsonKey(toJson: Task._tagsToJson)  List<ItemTag> tags)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Task() when $default != null:
return $default(_that.id,_that.title,_that.importance,_that.createdAt,_that.description,_that.modifiedAt,_that.completedAt,_that.canceledAt,_that.forDate,_that.persistent,_that.tags);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  TaskImportance importance,  DateTime createdAt,  String description,  DateTime? modifiedAt,  DateTime? completedAt,  DateTime? canceledAt,  DateTime? forDate,  bool persistent, @JsonKey(toJson: Task._tagsToJson)  List<ItemTag> tags)  $default,) {final _that = this;
switch (_that) {
case _Task():
return $default(_that.id,_that.title,_that.importance,_that.createdAt,_that.description,_that.modifiedAt,_that.completedAt,_that.canceledAt,_that.forDate,_that.persistent,_that.tags);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  TaskImportance importance,  DateTime createdAt,  String description,  DateTime? modifiedAt,  DateTime? completedAt,  DateTime? canceledAt,  DateTime? forDate,  bool persistent, @JsonKey(toJson: Task._tagsToJson)  List<ItemTag> tags)?  $default,) {final _that = this;
switch (_that) {
case _Task() when $default != null:
return $default(_that.id,_that.title,_that.importance,_that.createdAt,_that.description,_that.modifiedAt,_that.completedAt,_that.canceledAt,_that.forDate,_that.persistent,_that.tags);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Task extends Task {
   _Task({required this.id, required this.title, required this.importance, required this.createdAt, this.description = '', this.modifiedAt, this.completedAt, this.canceledAt, this.forDate, this.persistent = true, @JsonKey(toJson: Task._tagsToJson) final  List<ItemTag> tags = const []}): _tags = tags,super._();
  factory _Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

@override final  String id;
@override final  String title;
@override final  TaskImportance importance;
@override final  DateTime createdAt;
@override@JsonKey() final  String description;
@override final  DateTime? modifiedAt;
@override final  DateTime? completedAt;
@override final  DateTime? canceledAt;
@override final  DateTime? forDate;
@override@JsonKey() final  bool persistent;
 final  List<ItemTag> _tags;
@override@JsonKey(toJson: Task._tagsToJson) List<ItemTag> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}


/// Create a copy of Task
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaskCopyWith<_Task> get copyWith => __$TaskCopyWithImpl<_Task>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TaskToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Task&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.importance, importance) || other.importance == importance)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.description, description) || other.description == description)&&(identical(other.modifiedAt, modifiedAt) || other.modifiedAt == modifiedAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.canceledAt, canceledAt) || other.canceledAt == canceledAt)&&(identical(other.forDate, forDate) || other.forDate == forDate)&&(identical(other.persistent, persistent) || other.persistent == persistent)&&const DeepCollectionEquality().equals(other._tags, _tags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,importance,createdAt,description,modifiedAt,completedAt,canceledAt,forDate,persistent,const DeepCollectionEquality().hash(_tags));

@override
String toString() {
  return 'Task(id: $id, title: $title, importance: $importance, createdAt: $createdAt, description: $description, modifiedAt: $modifiedAt, completedAt: $completedAt, canceledAt: $canceledAt, forDate: $forDate, persistent: $persistent, tags: $tags)';
}


}

/// @nodoc
abstract mixin class _$TaskCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$TaskCopyWith(_Task value, $Res Function(_Task) _then) = __$TaskCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, TaskImportance importance, DateTime createdAt, String description, DateTime? modifiedAt, DateTime? completedAt, DateTime? canceledAt, DateTime? forDate, bool persistent,@JsonKey(toJson: Task._tagsToJson) List<ItemTag> tags
});




}
/// @nodoc
class __$TaskCopyWithImpl<$Res>
    implements _$TaskCopyWith<$Res> {
  __$TaskCopyWithImpl(this._self, this._then);

  final _Task _self;
  final $Res Function(_Task) _then;

/// Create a copy of Task
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? importance = null,Object? createdAt = null,Object? description = null,Object? modifiedAt = freezed,Object? completedAt = freezed,Object? canceledAt = freezed,Object? forDate = freezed,Object? persistent = null,Object? tags = null,}) {
  return _then(_Task(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,importance: null == importance ? _self.importance : importance // ignore: cast_nullable_to_non_nullable
as TaskImportance,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,modifiedAt: freezed == modifiedAt ? _self.modifiedAt : modifiedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,canceledAt: freezed == canceledAt ? _self.canceledAt : canceledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,forDate: freezed == forDate ? _self.forDate : forDate // ignore: cast_nullable_to_non_nullable
as DateTime?,persistent: null == persistent ? _self.persistent : persistent // ignore: cast_nullable_to_non_nullable
as bool,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<ItemTag>,
  ));
}


}

// dart format on
