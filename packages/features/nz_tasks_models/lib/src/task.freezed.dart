// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;


final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Task _$TaskFromJson(Map<String, dynamic> json) {
return _Task.fromJson(json);
}

/// @nodoc
mixin _$Task {

 String get id => throw _privateConstructorUsedError; String get title => throw _privateConstructorUsedError; TaskImportance get importance => throw _privateConstructorUsedError; DateTime get createdAt => throw _privateConstructorUsedError; DateTime get forDate => throw _privateConstructorUsedError; String get description => throw _privateConstructorUsedError; DateTime? get modifiedAt => throw _privateConstructorUsedError; DateTime? get completedAt => throw _privateConstructorUsedError; bool get persistent => throw _privateConstructorUsedError;@JsonKey(toJson: Task._tagsToJson, includeToJson: true, includeFromJson: false) List<ItemTag> get tags => throw _privateConstructorUsedError;






/// Serializes this Task to a JSON map.
Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
/// Create a copy of Task
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
$TaskCopyWith<Task> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $TaskCopyWith<$Res>  {
  factory $TaskCopyWith(Task value, $Res Function(Task) then) = _$TaskCopyWithImpl<$Res, Task>;
@useResult
$Res call({
 String id, String title, TaskImportance importance, DateTime createdAt, DateTime forDate, String description, DateTime? modifiedAt, DateTime? completedAt, bool persistent,@JsonKey(toJson: Task._tagsToJson, includeToJson: true, includeFromJson: false) List<ItemTag> tags
});



}

/// @nodoc
class _$TaskCopyWithImpl<$Res,$Val extends Task> implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

/// Create a copy of Task
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? importance = null,Object? createdAt = null,Object? forDate = null,Object? description = null,Object? modifiedAt = freezed,Object? completedAt = freezed,Object? persistent = null,Object? tags = null,}) {
  return _then(_value.copyWith(
id: null == id ? _value.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _value.title : title // ignore: cast_nullable_to_non_nullable
as String,importance: null == importance ? _value.importance : importance // ignore: cast_nullable_to_non_nullable
as TaskImportance,createdAt: null == createdAt ? _value.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,forDate: null == forDate ? _value.forDate : forDate // ignore: cast_nullable_to_non_nullable
as DateTime,description: null == description ? _value.description : description // ignore: cast_nullable_to_non_nullable
as String,modifiedAt: freezed == modifiedAt ? _value.modifiedAt : modifiedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,completedAt: freezed == completedAt ? _value.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,persistent: null == persistent ? _value.persistent : persistent // ignore: cast_nullable_to_non_nullable
as bool,tags: null == tags ? _value.tags : tags // ignore: cast_nullable_to_non_nullable
as List<ItemTag>,
  )as $Val);
}

}


/// @nodoc
abstract class _$$TaskImplCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$$TaskImplCopyWith(_$TaskImpl value, $Res Function(_$TaskImpl) then) = __$$TaskImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
 String id, String title, TaskImportance importance, DateTime createdAt, DateTime forDate, String description, DateTime? modifiedAt, DateTime? completedAt, bool persistent,@JsonKey(toJson: Task._tagsToJson, includeToJson: true, includeFromJson: false) List<ItemTag> tags
});



}

/// @nodoc
class __$$TaskImplCopyWithImpl<$Res> extends _$TaskCopyWithImpl<$Res, _$TaskImpl> implements _$$TaskImplCopyWith<$Res> {
  __$$TaskImplCopyWithImpl(_$TaskImpl _value, $Res Function(_$TaskImpl) _then)
      : super(_value, _then);


/// Create a copy of Task
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? importance = null,Object? createdAt = null,Object? forDate = null,Object? description = null,Object? modifiedAt = freezed,Object? completedAt = freezed,Object? persistent = null,Object? tags = null,}) {
  return _then(_$TaskImpl(
id: null == id ? _value.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _value.title : title // ignore: cast_nullable_to_non_nullable
as String,importance: null == importance ? _value.importance : importance // ignore: cast_nullable_to_non_nullable
as TaskImportance,createdAt: null == createdAt ? _value.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,forDate: null == forDate ? _value.forDate : forDate // ignore: cast_nullable_to_non_nullable
as DateTime,description: null == description ? _value.description : description // ignore: cast_nullable_to_non_nullable
as String,modifiedAt: freezed == modifiedAt ? _value.modifiedAt : modifiedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,completedAt: freezed == completedAt ? _value.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,persistent: null == persistent ? _value.persistent : persistent // ignore: cast_nullable_to_non_nullable
as bool,tags: null == tags ? _value._tags : tags // ignore: cast_nullable_to_non_nullable
as List<ItemTag>,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _$TaskImpl extends _Task  {
   _$TaskImpl({required this.id, required this.title, required this.importance, required this.createdAt, required this.forDate, this.description = '', this.modifiedAt, this.completedAt, this.persistent = false, @JsonKey(toJson: Task._tagsToJson, includeToJson: true, includeFromJson: false) final  List<ItemTag> tags = const []}): _tags = tags,super._();

  factory _$TaskImpl.fromJson(Map<String, dynamic> json) => _$$TaskImplFromJson(json);

@override final  String id;
@override final  String title;
@override final  TaskImportance importance;
@override final  DateTime createdAt;
@override final  DateTime forDate;
@override@JsonKey() final  String description;
@override final  DateTime? modifiedAt;
@override final  DateTime? completedAt;
@override@JsonKey() final  bool persistent;
 final  List<ItemTag> _tags;
@override@JsonKey(toJson: Task._tagsToJson, includeToJson: true, includeFromJson: false) List<ItemTag> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}


@override
String toString() {
  return 'Task(id: $id, title: $title, importance: $importance, createdAt: $createdAt, forDate: $forDate, description: $description, modifiedAt: $modifiedAt, completedAt: $completedAt, persistent: $persistent, tags: $tags)';
}


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$TaskImpl&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.importance, importance) || other.importance == importance)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.forDate, forDate) || other.forDate == forDate)&&(identical(other.description, description) || other.description == description)&&(identical(other.modifiedAt, modifiedAt) || other.modifiedAt == modifiedAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.persistent, persistent) || other.persistent == persistent)&&const DeepCollectionEquality().equals(other._tags, _tags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,importance,createdAt,forDate,description,modifiedAt,completedAt,persistent,const DeepCollectionEquality().hash(_tags));

/// Create a copy of Task
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@override
@pragma('vm:prefer-inline')
_$$TaskImplCopyWith<_$TaskImpl> get copyWith => __$$TaskImplCopyWithImpl<_$TaskImpl>(this, _$identity);







@override
Map<String, dynamic> toJson() {
  return _$$TaskImplToJson(this, );
}
}


abstract class _Task extends Task {
   factory _Task({required final  String id, required final  String title, required final  TaskImportance importance, required final  DateTime createdAt, required final  DateTime forDate, final  String description, final  DateTime? modifiedAt, final  DateTime? completedAt, final  bool persistent, @JsonKey(toJson: Task._tagsToJson, includeToJson: true, includeFromJson: false) final  List<ItemTag> tags}) = _$TaskImpl;
   _Task._(): super._();

  factory _Task.fromJson(Map<String, dynamic> json) = _$TaskImpl.fromJson;

@override String get id;@override String get title;@override TaskImportance get importance;@override DateTime get createdAt;@override DateTime get forDate;@override String get description;@override DateTime? get modifiedAt;@override DateTime? get completedAt;@override bool get persistent;@override@JsonKey(toJson: Task._tagsToJson, includeToJson: true, includeFromJson: false) List<ItemTag> get tags;
/// Create a copy of Task
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
_$$TaskImplCopyWith<_$TaskImpl> get copyWith => throw _privateConstructorUsedError;

}
