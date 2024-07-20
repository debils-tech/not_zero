// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'config_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConfigModel _$ConfigModelFromJson(Map<String, dynamic> json) {
  return _ConfigModel.fromJson(json);
}

/// @nodoc
mixin _$ConfigModel {
  int get id => throw _privateConstructorUsedError;
  bool get enabled => throw _privateConstructorUsedError;
  String get key => throw _privateConstructorUsedError;
  Object get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConfigModelCopyWith<ConfigModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfigModelCopyWith<$Res> {
  factory $ConfigModelCopyWith(
          ConfigModel value, $Res Function(ConfigModel) then) =
      _$ConfigModelCopyWithImpl<$Res, ConfigModel>;
  @useResult
  $Res call({int id, bool enabled, String key, Object data});
}

/// @nodoc
class _$ConfigModelCopyWithImpl<$Res, $Val extends ConfigModel>
    implements $ConfigModelCopyWith<$Res> {
  _$ConfigModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? enabled = null,
    Object? key = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data ? _value.data : data,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConfigModelImplCopyWith<$Res>
    implements $ConfigModelCopyWith<$Res> {
  factory _$$ConfigModelImplCopyWith(
          _$ConfigModelImpl value, $Res Function(_$ConfigModelImpl) then) =
      __$$ConfigModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, bool enabled, String key, Object data});
}

/// @nodoc
class __$$ConfigModelImplCopyWithImpl<$Res>
    extends _$ConfigModelCopyWithImpl<$Res, _$ConfigModelImpl>
    implements _$$ConfigModelImplCopyWith<$Res> {
  __$$ConfigModelImplCopyWithImpl(
      _$ConfigModelImpl _value, $Res Function(_$ConfigModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? enabled = null,
    Object? key = null,
    Object? data = null,
  }) {
    return _then(_$ConfigModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data ? _value.data : data,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConfigModelImpl extends _ConfigModel {
  const _$ConfigModelImpl(
      {required this.id,
      required this.enabled,
      required this.key,
      required this.data})
      : super._();

  factory _$ConfigModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConfigModelImplFromJson(json);

  @override
  final int id;
  @override
  final bool enabled;
  @override
  final String key;
  @override
  final Object data;

  @override
  String toString() {
    return 'ConfigModel(id: $id, enabled: $enabled, key: $key, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfigModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.key, key) || other.key == key) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, enabled, key, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfigModelImplCopyWith<_$ConfigModelImpl> get copyWith =>
      __$$ConfigModelImplCopyWithImpl<_$ConfigModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConfigModelImplToJson(
      this,
    );
  }
}

abstract class _ConfigModel extends ConfigModel {
  const factory _ConfigModel(
      {required final int id,
      required final bool enabled,
      required final String key,
      required final Object data}) = _$ConfigModelImpl;
  const _ConfigModel._() : super._();

  factory _ConfigModel.fromJson(Map<String, dynamic> json) =
      _$ConfigModelImpl.fromJson;

  @override
  int get id;
  @override
  bool get enabled;
  @override
  String get key;
  @override
  Object get data;
  @override
  @JsonKey(ignore: true)
  _$$ConfigModelImplCopyWith<_$ConfigModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
