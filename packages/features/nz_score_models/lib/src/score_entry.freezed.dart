// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'score_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;


final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ScoreEntry _$ScoreEntryFromJson(Map<String, dynamic> json) {
return _ScoreEntry.fromJson(json);
}

/// @nodoc
mixin _$ScoreEntry {

 String get id => throw _privateConstructorUsedError; DateTime get createdAt => throw _privateConstructorUsedError; int get score => throw _privateConstructorUsedError; ScoreEntryType get scoreType => throw _privateConstructorUsedError; ScoreEntryMetadata get metadata => throw _privateConstructorUsedError;






/// Serializes this ScoreEntry to a JSON map.
Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
/// Create a copy of ScoreEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
$ScoreEntryCopyWith<ScoreEntry> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $ScoreEntryCopyWith<$Res>  {
  factory $ScoreEntryCopyWith(ScoreEntry value, $Res Function(ScoreEntry) then) = _$ScoreEntryCopyWithImpl<$Res, ScoreEntry>;
@useResult
$Res call({
 String id, DateTime createdAt, int score, ScoreEntryType scoreType, ScoreEntryMetadata metadata
});


$ScoreEntryMetadataCopyWith<$Res> get metadata;
}

/// @nodoc
class _$ScoreEntryCopyWithImpl<$Res,$Val extends ScoreEntry> implements $ScoreEntryCopyWith<$Res> {
  _$ScoreEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

/// Create a copy of ScoreEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? createdAt = null,Object? score = null,Object? scoreType = null,Object? metadata = null,}) {
  return _then(_value.copyWith(
id: null == id ? _value.id : id // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _value.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,score: null == score ? _value.score : score // ignore: cast_nullable_to_non_nullable
as int,scoreType: null == scoreType ? _value.scoreType : scoreType // ignore: cast_nullable_to_non_nullable
as ScoreEntryType,metadata: null == metadata ? _value.metadata : metadata // ignore: cast_nullable_to_non_nullable
as ScoreEntryMetadata,
  )as $Val);
}
/// Create a copy of ScoreEntry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScoreEntryMetadataCopyWith<$Res> get metadata {
  
  return $ScoreEntryMetadataCopyWith<$Res>(_value.metadata, (value) {
    return _then(_value.copyWith(metadata: value) as $Val);
  });
}
}


/// @nodoc
abstract class _$$ScoreEntryImplCopyWith<$Res> implements $ScoreEntryCopyWith<$Res> {
  factory _$$ScoreEntryImplCopyWith(_$ScoreEntryImpl value, $Res Function(_$ScoreEntryImpl) then) = __$$ScoreEntryImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
 String id, DateTime createdAt, int score, ScoreEntryType scoreType, ScoreEntryMetadata metadata
});


@override $ScoreEntryMetadataCopyWith<$Res> get metadata;
}

/// @nodoc
class __$$ScoreEntryImplCopyWithImpl<$Res> extends _$ScoreEntryCopyWithImpl<$Res, _$ScoreEntryImpl> implements _$$ScoreEntryImplCopyWith<$Res> {
  __$$ScoreEntryImplCopyWithImpl(_$ScoreEntryImpl _value, $Res Function(_$ScoreEntryImpl) _then)
      : super(_value, _then);


/// Create a copy of ScoreEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? createdAt = null,Object? score = null,Object? scoreType = null,Object? metadata = null,}) {
  return _then(_$ScoreEntryImpl(
id: null == id ? _value.id : id // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _value.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,score: null == score ? _value.score : score // ignore: cast_nullable_to_non_nullable
as int,scoreType: null == scoreType ? _value.scoreType : scoreType // ignore: cast_nullable_to_non_nullable
as ScoreEntryType,metadata: null == metadata ? _value.metadata : metadata // ignore: cast_nullable_to_non_nullable
as ScoreEntryMetadata,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _$ScoreEntryImpl  implements _ScoreEntry {
  const _$ScoreEntryImpl({required this.id, required this.createdAt, required this.score, required this.scoreType, this.metadata = const ScoreEntryMetadata.none()});

  factory _$ScoreEntryImpl.fromJson(Map<String, dynamic> json) => _$$ScoreEntryImplFromJson(json);

@override final  String id;
@override final  DateTime createdAt;
@override final  int score;
@override final  ScoreEntryType scoreType;
@override@JsonKey() final  ScoreEntryMetadata metadata;

@override
String toString() {
  return 'ScoreEntry(id: $id, createdAt: $createdAt, score: $score, scoreType: $scoreType, metadata: $metadata)';
}


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$ScoreEntryImpl&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.score, score) || other.score == score)&&(identical(other.scoreType, scoreType) || other.scoreType == scoreType)&&(identical(other.metadata, metadata) || other.metadata == metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,score,scoreType,metadata);

/// Create a copy of ScoreEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@override
@pragma('vm:prefer-inline')
_$$ScoreEntryImplCopyWith<_$ScoreEntryImpl> get copyWith => __$$ScoreEntryImplCopyWithImpl<_$ScoreEntryImpl>(this, _$identity);







@override
Map<String, dynamic> toJson() {
  return _$$ScoreEntryImplToJson(this, );
}
}


abstract class _ScoreEntry implements ScoreEntry {
  const factory _ScoreEntry({required final  String id, required final  DateTime createdAt, required final  int score, required final  ScoreEntryType scoreType, final  ScoreEntryMetadata metadata}) = _$ScoreEntryImpl;
  

  factory _ScoreEntry.fromJson(Map<String, dynamic> json) = _$ScoreEntryImpl.fromJson;

@override String get id;@override DateTime get createdAt;@override int get score;@override ScoreEntryType get scoreType;@override ScoreEntryMetadata get metadata;
/// Create a copy of ScoreEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
_$$ScoreEntryImplCopyWith<_$ScoreEntryImpl> get copyWith => throw _privateConstructorUsedError;

}

ScoreEntryMetadata _$ScoreEntryMetadataFromJson(Map<String, dynamic> json) {
        switch (json['type']) {
                  case 'none':
          return ScoreEntryMetadataNone.fromJson(json);
                case 'task':
          return ScoreEntryMetadataTask.fromJson(json);
        
          default:
            throw CheckedFromJsonException(json, 'type', 'ScoreEntryMetadata', 'Invalid union type "${json['type']}"!');
        }
      
}

/// @nodoc
mixin _$ScoreEntryMetadata {








/// Serializes this ScoreEntryMetadata to a JSON map.
Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $ScoreEntryMetadataCopyWith<$Res>  {
  factory $ScoreEntryMetadataCopyWith(ScoreEntryMetadata value, $Res Function(ScoreEntryMetadata) then) = _$ScoreEntryMetadataCopyWithImpl<$Res, ScoreEntryMetadata>;



}

/// @nodoc
class _$ScoreEntryMetadataCopyWithImpl<$Res,$Val extends ScoreEntryMetadata> implements $ScoreEntryMetadataCopyWith<$Res> {
  _$ScoreEntryMetadataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

/// Create a copy of ScoreEntryMetadata
/// with the given fields replaced by the non-null parameter values.


}


/// @nodoc
abstract class _$$ScoreEntryMetadataNoneImplCopyWith<$Res>  {
  factory _$$ScoreEntryMetadataNoneImplCopyWith(_$ScoreEntryMetadataNoneImpl value, $Res Function(_$ScoreEntryMetadataNoneImpl) then) = __$$ScoreEntryMetadataNoneImplCopyWithImpl<$Res>;



}

/// @nodoc
class __$$ScoreEntryMetadataNoneImplCopyWithImpl<$Res> extends _$ScoreEntryMetadataCopyWithImpl<$Res, _$ScoreEntryMetadataNoneImpl> implements _$$ScoreEntryMetadataNoneImplCopyWith<$Res> {
  __$$ScoreEntryMetadataNoneImplCopyWithImpl(_$ScoreEntryMetadataNoneImpl _value, $Res Function(_$ScoreEntryMetadataNoneImpl) _then)
      : super(_value, _then);


/// Create a copy of ScoreEntryMetadata
/// with the given fields replaced by the non-null parameter values.



}

/// @nodoc
@JsonSerializable()

class _$ScoreEntryMetadataNoneImpl  implements ScoreEntryMetadataNone {
  const _$ScoreEntryMetadataNoneImpl({final  String? $type}): $type = $type ?? 'none';

  factory _$ScoreEntryMetadataNoneImpl.fromJson(Map<String, dynamic> json) => _$$ScoreEntryMetadataNoneImplFromJson(json);



@JsonKey(name: 'type')
final String $type;


@override
String toString() {
  return 'ScoreEntryMetadata.none()';
}


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$ScoreEntryMetadataNoneImpl);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;








@override
Map<String, dynamic> toJson() {
  return _$$ScoreEntryMetadataNoneImplToJson(this, );
}
}


abstract class ScoreEntryMetadataNone implements ScoreEntryMetadata {
  const factory ScoreEntryMetadataNone() = _$ScoreEntryMetadataNoneImpl;
  

  factory ScoreEntryMetadataNone.fromJson(Map<String, dynamic> json) = _$ScoreEntryMetadataNoneImpl.fromJson;



}

/// @nodoc
abstract class _$$ScoreEntryMetadataTaskImplCopyWith<$Res>  {
  factory _$$ScoreEntryMetadataTaskImplCopyWith(_$ScoreEntryMetadataTaskImpl value, $Res Function(_$ScoreEntryMetadataTaskImpl) then) = __$$ScoreEntryMetadataTaskImplCopyWithImpl<$Res>;
@useResult
$Res call({
@JsonKey(name: 'task_id') String associatedTaskId
});



}

/// @nodoc
class __$$ScoreEntryMetadataTaskImplCopyWithImpl<$Res> extends _$ScoreEntryMetadataCopyWithImpl<$Res, _$ScoreEntryMetadataTaskImpl> implements _$$ScoreEntryMetadataTaskImplCopyWith<$Res> {
  __$$ScoreEntryMetadataTaskImplCopyWithImpl(_$ScoreEntryMetadataTaskImpl _value, $Res Function(_$ScoreEntryMetadataTaskImpl) _then)
      : super(_value, _then);


/// Create a copy of ScoreEntryMetadata
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? associatedTaskId = null,}) {
  return _then(_$ScoreEntryMetadataTaskImpl(
associatedTaskId: null == associatedTaskId ? _value.associatedTaskId : associatedTaskId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _$ScoreEntryMetadataTaskImpl  implements ScoreEntryMetadataTask {
  const _$ScoreEntryMetadataTaskImpl({@JsonKey(name: 'task_id') required this.associatedTaskId, final  String? $type}): $type = $type ?? 'task';

  factory _$ScoreEntryMetadataTaskImpl.fromJson(Map<String, dynamic> json) => _$$ScoreEntryMetadataTaskImplFromJson(json);

@override@JsonKey(name: 'task_id') final  String associatedTaskId;

@JsonKey(name: 'type')
final String $type;


@override
String toString() {
  return 'ScoreEntryMetadata.task(associatedTaskId: $associatedTaskId)';
}


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$ScoreEntryMetadataTaskImpl&&(identical(other.associatedTaskId, associatedTaskId) || other.associatedTaskId == associatedTaskId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,associatedTaskId);

/// Create a copy of ScoreEntryMetadata
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@override
@pragma('vm:prefer-inline')
_$$ScoreEntryMetadataTaskImplCopyWith<_$ScoreEntryMetadataTaskImpl> get copyWith => __$$ScoreEntryMetadataTaskImplCopyWithImpl<_$ScoreEntryMetadataTaskImpl>(this, _$identity);







@override
Map<String, dynamic> toJson() {
  return _$$ScoreEntryMetadataTaskImplToJson(this, );
}
}


abstract class ScoreEntryMetadataTask implements ScoreEntryMetadata {
  const factory ScoreEntryMetadataTask({@JsonKey(name: 'task_id') required final  String associatedTaskId}) = _$ScoreEntryMetadataTaskImpl;
  

  factory ScoreEntryMetadataTask.fromJson(Map<String, dynamic> json) = _$ScoreEntryMetadataTaskImpl.fromJson;

@JsonKey(name: 'task_id') String get associatedTaskId;
/// Create a copy of ScoreEntryMetadata
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
_$$ScoreEntryMetadataTaskImplCopyWith<_$ScoreEntryMetadataTaskImpl> get copyWith => throw _privateConstructorUsedError;

}
