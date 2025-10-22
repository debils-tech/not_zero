// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'habit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Habit {

 String get id; String get title; String get description; TaskImportance get importance; DateTime get createdAt; DateTime? get modifiedAt;@JsonKey(toJson: Habit._completionsToJson) List<HabitCompletion> get completions; HabitRegularity get regularity;
/// Create a copy of Habit
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HabitCopyWith<Habit> get copyWith => _$HabitCopyWithImpl<Habit>(this as Habit, _$identity);

  /// Serializes this Habit to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Habit&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.importance, importance) || other.importance == importance)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.modifiedAt, modifiedAt) || other.modifiedAt == modifiedAt)&&const DeepCollectionEquality().equals(other.completions, completions)&&(identical(other.regularity, regularity) || other.regularity == regularity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,importance,createdAt,modifiedAt,const DeepCollectionEquality().hash(completions),regularity);

@override
String toString() {
  return 'Habit(id: $id, title: $title, description: $description, importance: $importance, createdAt: $createdAt, modifiedAt: $modifiedAt, completions: $completions, regularity: $regularity)';
}


}

/// @nodoc
abstract mixin class $HabitCopyWith<$Res>  {
  factory $HabitCopyWith(Habit value, $Res Function(Habit) _then) = _$HabitCopyWithImpl;
@useResult
$Res call({
 String id, String title, String description, TaskImportance importance, DateTime createdAt, DateTime? modifiedAt,@JsonKey(toJson: Habit._completionsToJson) List<HabitCompletion> completions, HabitRegularity regularity
});


$HabitRegularityCopyWith<$Res> get regularity;

}
/// @nodoc
class _$HabitCopyWithImpl<$Res>
    implements $HabitCopyWith<$Res> {
  _$HabitCopyWithImpl(this._self, this._then);

  final Habit _self;
  final $Res Function(Habit) _then;

/// Create a copy of Habit
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? importance = null,Object? createdAt = null,Object? modifiedAt = freezed,Object? completions = null,Object? regularity = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,importance: null == importance ? _self.importance : importance // ignore: cast_nullable_to_non_nullable
as TaskImportance,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,modifiedAt: freezed == modifiedAt ? _self.modifiedAt : modifiedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,completions: null == completions ? _self.completions : completions // ignore: cast_nullable_to_non_nullable
as List<HabitCompletion>,regularity: null == regularity ? _self.regularity : regularity // ignore: cast_nullable_to_non_nullable
as HabitRegularity,
  ));
}
/// Create a copy of Habit
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HabitRegularityCopyWith<$Res> get regularity {
  
  return $HabitRegularityCopyWith<$Res>(_self.regularity, (value) {
    return _then(_self.copyWith(regularity: value));
  });
}
}


/// Adds pattern-matching-related methods to [Habit].
extension HabitPatterns on Habit {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Habit value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Habit() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Habit value)  $default,){
final _that = this;
switch (_that) {
case _Habit():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Habit value)?  $default,){
final _that = this;
switch (_that) {
case _Habit() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String description,  TaskImportance importance,  DateTime createdAt,  DateTime? modifiedAt, @JsonKey(toJson: Habit._completionsToJson)  List<HabitCompletion> completions,  HabitRegularity regularity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Habit() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.importance,_that.createdAt,_that.modifiedAt,_that.completions,_that.regularity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String description,  TaskImportance importance,  DateTime createdAt,  DateTime? modifiedAt, @JsonKey(toJson: Habit._completionsToJson)  List<HabitCompletion> completions,  HabitRegularity regularity)  $default,) {final _that = this;
switch (_that) {
case _Habit():
return $default(_that.id,_that.title,_that.description,_that.importance,_that.createdAt,_that.modifiedAt,_that.completions,_that.regularity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String description,  TaskImportance importance,  DateTime createdAt,  DateTime? modifiedAt, @JsonKey(toJson: Habit._completionsToJson)  List<HabitCompletion> completions,  HabitRegularity regularity)?  $default,) {final _that = this;
switch (_that) {
case _Habit() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.importance,_that.createdAt,_that.modifiedAt,_that.completions,_that.regularity);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Habit extends Habit {
  const _Habit({required this.id, required this.title, this.description = '', this.importance = TaskImportance.normal, required this.createdAt, this.modifiedAt, @JsonKey(toJson: Habit._completionsToJson) final  List<HabitCompletion> completions = const [], this.regularity = const HabitRegularity.daily()}): _completions = completions,super._();
  factory _Habit.fromJson(Map<String, dynamic> json) => _$HabitFromJson(json);

@override final  String id;
@override final  String title;
@override@JsonKey() final  String description;
@override@JsonKey() final  TaskImportance importance;
@override final  DateTime createdAt;
@override final  DateTime? modifiedAt;
 final  List<HabitCompletion> _completions;
@override@JsonKey(toJson: Habit._completionsToJson) List<HabitCompletion> get completions {
  if (_completions is EqualUnmodifiableListView) return _completions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_completions);
}

@override@JsonKey() final  HabitRegularity regularity;

/// Create a copy of Habit
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HabitCopyWith<_Habit> get copyWith => __$HabitCopyWithImpl<_Habit>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HabitToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Habit&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.importance, importance) || other.importance == importance)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.modifiedAt, modifiedAt) || other.modifiedAt == modifiedAt)&&const DeepCollectionEquality().equals(other._completions, _completions)&&(identical(other.regularity, regularity) || other.regularity == regularity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,importance,createdAt,modifiedAt,const DeepCollectionEquality().hash(_completions),regularity);

@override
String toString() {
  return 'Habit(id: $id, title: $title, description: $description, importance: $importance, createdAt: $createdAt, modifiedAt: $modifiedAt, completions: $completions, regularity: $regularity)';
}


}

/// @nodoc
abstract mixin class _$HabitCopyWith<$Res> implements $HabitCopyWith<$Res> {
  factory _$HabitCopyWith(_Habit value, $Res Function(_Habit) _then) = __$HabitCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String description, TaskImportance importance, DateTime createdAt, DateTime? modifiedAt,@JsonKey(toJson: Habit._completionsToJson) List<HabitCompletion> completions, HabitRegularity regularity
});


@override $HabitRegularityCopyWith<$Res> get regularity;

}
/// @nodoc
class __$HabitCopyWithImpl<$Res>
    implements _$HabitCopyWith<$Res> {
  __$HabitCopyWithImpl(this._self, this._then);

  final _Habit _self;
  final $Res Function(_Habit) _then;

/// Create a copy of Habit
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? importance = null,Object? createdAt = null,Object? modifiedAt = freezed,Object? completions = null,Object? regularity = null,}) {
  return _then(_Habit(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,importance: null == importance ? _self.importance : importance // ignore: cast_nullable_to_non_nullable
as TaskImportance,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,modifiedAt: freezed == modifiedAt ? _self.modifiedAt : modifiedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,completions: null == completions ? _self._completions : completions // ignore: cast_nullable_to_non_nullable
as List<HabitCompletion>,regularity: null == regularity ? _self.regularity : regularity // ignore: cast_nullable_to_non_nullable
as HabitRegularity,
  ));
}

/// Create a copy of Habit
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HabitRegularityCopyWith<$Res> get regularity {
  
  return $HabitRegularityCopyWith<$Res>(_self.regularity, (value) {
    return _then(_self.copyWith(regularity: value));
  });
}
}

// dart format on
