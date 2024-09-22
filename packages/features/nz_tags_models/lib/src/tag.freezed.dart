// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tag.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;


final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ItemTag _$ItemTagFromJson(Map<String, dynamic> json) {
return _ItemTag.fromJson(json);
}

/// @nodoc
mixin _$ItemTag {

 String get id => throw _privateConstructorUsedError; String get name => throw _privateConstructorUsedError; DateTime get createdAt => throw _privateConstructorUsedError;@JsonKey(name: 'color') int get colorIndex => throw _privateConstructorUsedError;






/// Serializes this ItemTag to a JSON map.
Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
/// Create a copy of ItemTag
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
$ItemTagCopyWith<ItemTag> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $ItemTagCopyWith<$Res>  {
  factory $ItemTagCopyWith(ItemTag value, $Res Function(ItemTag) then) = _$ItemTagCopyWithImpl<$Res, ItemTag>;
@useResult
$Res call({
 String id, String name, DateTime createdAt,@JsonKey(name: 'color') int colorIndex
});



}

/// @nodoc
class _$ItemTagCopyWithImpl<$Res,$Val extends ItemTag> implements $ItemTagCopyWith<$Res> {
  _$ItemTagCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

/// Create a copy of ItemTag
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? createdAt = null,Object? colorIndex = null,}) {
  return _then(_value.copyWith(
id: null == id ? _value.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _value.name : name // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _value.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,colorIndex: null == colorIndex ? _value.colorIndex : colorIndex // ignore: cast_nullable_to_non_nullable
as int,
  )as $Val);
}

}


/// @nodoc
abstract class _$$ItemTagImplCopyWith<$Res> implements $ItemTagCopyWith<$Res> {
  factory _$$ItemTagImplCopyWith(_$ItemTagImpl value, $Res Function(_$ItemTagImpl) then) = __$$ItemTagImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
 String id, String name, DateTime createdAt,@JsonKey(name: 'color') int colorIndex
});



}

/// @nodoc
class __$$ItemTagImplCopyWithImpl<$Res> extends _$ItemTagCopyWithImpl<$Res, _$ItemTagImpl> implements _$$ItemTagImplCopyWith<$Res> {
  __$$ItemTagImplCopyWithImpl(_$ItemTagImpl _value, $Res Function(_$ItemTagImpl) _then)
      : super(_value, _then);


/// Create a copy of ItemTag
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? createdAt = null,Object? colorIndex = null,}) {
  return _then(_$ItemTagImpl(
id: null == id ? _value.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _value.name : name // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _value.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,colorIndex: null == colorIndex ? _value.colorIndex : colorIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _$ItemTagImpl extends _ItemTag  {
   _$ItemTagImpl({required this.id, required this.name, required this.createdAt, @JsonKey(name: 'color') this.colorIndex = 0}): super._();

  factory _$ItemTagImpl.fromJson(Map<String, dynamic> json) => _$$ItemTagImplFromJson(json);

@override final  String id;
@override final  String name;
@override final  DateTime createdAt;
@override@JsonKey(name: 'color') final  int colorIndex;

@override
String toString() {
  return 'ItemTag(id: $id, name: $name, createdAt: $createdAt, colorIndex: $colorIndex)';
}


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$ItemTagImpl&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.colorIndex, colorIndex) || other.colorIndex == colorIndex));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,createdAt,colorIndex);

/// Create a copy of ItemTag
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@override
@pragma('vm:prefer-inline')
_$$ItemTagImplCopyWith<_$ItemTagImpl> get copyWith => __$$ItemTagImplCopyWithImpl<_$ItemTagImpl>(this, _$identity);







@override
Map<String, dynamic> toJson() {
  return _$$ItemTagImplToJson(this, );
}
}


abstract class _ItemTag extends ItemTag {
   factory _ItemTag({required final  String id, required final  String name, required final  DateTime createdAt, @JsonKey(name: 'color') final  int colorIndex}) = _$ItemTagImpl;
   _ItemTag._(): super._();

  factory _ItemTag.fromJson(Map<String, dynamic> json) = _$ItemTagImpl.fromJson;

@override String get id;@override String get name;@override DateTime get createdAt;@override@JsonKey(name: 'color') int get colorIndex;
/// Create a copy of ItemTag
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
_$$ItemTagImplCopyWith<_$ItemTagImpl> get copyWith => throw _privateConstructorUsedError;

}
