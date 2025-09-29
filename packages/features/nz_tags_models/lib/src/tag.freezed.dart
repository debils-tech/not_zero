// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tag.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ItemTag {

 String get id; String get name; DateTime get createdAt;@JsonKey(name: 'color') int get colorIndex;
/// Create a copy of ItemTag
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ItemTagCopyWith<ItemTag> get copyWith => _$ItemTagCopyWithImpl<ItemTag>(this as ItemTag, _$identity);

  /// Serializes this ItemTag to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ItemTag&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.colorIndex, colorIndex) || other.colorIndex == colorIndex));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,createdAt,colorIndex);

@override
String toString() {
  return 'ItemTag(id: $id, name: $name, createdAt: $createdAt, colorIndex: $colorIndex)';
}


}

/// @nodoc
abstract mixin class $ItemTagCopyWith<$Res>  {
  factory $ItemTagCopyWith(ItemTag value, $Res Function(ItemTag) _then) = _$ItemTagCopyWithImpl;
@useResult
$Res call({
 String id, String name, DateTime createdAt,@JsonKey(name: 'color') int colorIndex
});




}
/// @nodoc
class _$ItemTagCopyWithImpl<$Res>
    implements $ItemTagCopyWith<$Res> {
  _$ItemTagCopyWithImpl(this._self, this._then);

  final ItemTag _self;
  final $Res Function(ItemTag) _then;

/// Create a copy of ItemTag
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? createdAt = null,Object? colorIndex = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,colorIndex: null == colorIndex ? _self.colorIndex : colorIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}



/// @nodoc
@JsonSerializable()

class _ItemTag extends ItemTag {
   _ItemTag({required this.id, required this.name, required this.createdAt, @JsonKey(name: 'color') this.colorIndex = 0}): super._();
  factory _ItemTag.fromJson(Map<String, dynamic> json) => _$ItemTagFromJson(json);

@override final  String id;
@override final  String name;
@override final  DateTime createdAt;
@override@JsonKey(name: 'color') final  int colorIndex;

/// Create a copy of ItemTag
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ItemTagCopyWith<_ItemTag> get copyWith => __$ItemTagCopyWithImpl<_ItemTag>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ItemTagToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ItemTag&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.colorIndex, colorIndex) || other.colorIndex == colorIndex));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,createdAt,colorIndex);

@override
String toString() {
  return 'ItemTag(id: $id, name: $name, createdAt: $createdAt, colorIndex: $colorIndex)';
}


}

/// @nodoc
abstract mixin class _$ItemTagCopyWith<$Res> implements $ItemTagCopyWith<$Res> {
  factory _$ItemTagCopyWith(_ItemTag value, $Res Function(_ItemTag) _then) = __$ItemTagCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, DateTime createdAt,@JsonKey(name: 'color') int colorIndex
});




}
/// @nodoc
class __$ItemTagCopyWithImpl<$Res>
    implements _$ItemTagCopyWith<$Res> {
  __$ItemTagCopyWithImpl(this._self, this._then);

  final _ItemTag _self;
  final $Res Function(_ItemTag) _then;

/// Create a copy of ItemTag
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? createdAt = null,Object? colorIndex = null,}) {
  return _then(_ItemTag(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,colorIndex: null == colorIndex ? _self.colorIndex : colorIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
