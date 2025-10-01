// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'backup_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

BackupModel _$BackupModelFromJson(Map<String, dynamic> json) {
  return _BackupModel.fromJson(json);
}

/// @nodoc
mixin _$BackupModel {
  Map<String, dynamic> get data => throw _privateConstructorUsedError;
  int get version => throw _privateConstructorUsedError;
  @JsonKey(name: 'app_info')
  AppInfo? get appInfo => throw _privateConstructorUsedError;

  /// Serializes this BackupModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BackupModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BackupModelCopyWith<BackupModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BackupModelCopyWith<$Res> {
  factory $BackupModelCopyWith(
    BackupModel value,
    $Res Function(BackupModel) then,
  ) = _$BackupModelCopyWithImpl<$Res, BackupModel>;
  @useResult
  $Res call({
    Map<String, dynamic> data,
    int version,
    @JsonKey(name: 'app_info') AppInfo? appInfo,
  });

  $AppInfoCopyWith<$Res>? get appInfo;
}

/// @nodoc
class _$BackupModelCopyWithImpl<$Res, $Val extends BackupModel>
    implements $BackupModelCopyWith<$Res> {
  _$BackupModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BackupModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? version = null,
    Object? appInfo = freezed,
  }) {
    return _then(
      _value.copyWith(
            data: null == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
            version: null == version
                ? _value.version
                : version // ignore: cast_nullable_to_non_nullable
                      as int,
            appInfo: freezed == appInfo
                ? _value.appInfo
                : appInfo // ignore: cast_nullable_to_non_nullable
                      as AppInfo?,
          )
          as $Val,
    );
  }

  /// Create a copy of BackupModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppInfoCopyWith<$Res>? get appInfo {
    if (_value.appInfo == null) {
      return null;
    }

    return $AppInfoCopyWith<$Res>(_value.appInfo!, (value) {
      return _then(_value.copyWith(appInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BackupModelImplCopyWith<$Res>
    implements $BackupModelCopyWith<$Res> {
  factory _$$BackupModelImplCopyWith(
    _$BackupModelImpl value,
    $Res Function(_$BackupModelImpl) then,
  ) = __$$BackupModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Map<String, dynamic> data,
    int version,
    @JsonKey(name: 'app_info') AppInfo? appInfo,
  });

  @override
  $AppInfoCopyWith<$Res>? get appInfo;
}

/// @nodoc
class __$$BackupModelImplCopyWithImpl<$Res>
    extends _$BackupModelCopyWithImpl<$Res, _$BackupModelImpl>
    implements _$$BackupModelImplCopyWith<$Res> {
  __$$BackupModelImplCopyWithImpl(
    _$BackupModelImpl _value,
    $Res Function(_$BackupModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BackupModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? version = null,
    Object? appInfo = freezed,
  }) {
    return _then(
      _$BackupModelImpl(
        data: null == data
            ? _value._data
            : data // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
        version: null == version
            ? _value.version
            : version // ignore: cast_nullable_to_non_nullable
                  as int,
        appInfo: freezed == appInfo
            ? _value.appInfo
            : appInfo // ignore: cast_nullable_to_non_nullable
                  as AppInfo?,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$BackupModelImpl implements _BackupModel {
  _$BackupModelImpl({
    required final Map<String, dynamic> data,
    this.version = 1,
    @JsonKey(name: 'app_info') this.appInfo,
  }) : _data = data;

  factory _$BackupModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BackupModelImplFromJson(json);

  final Map<String, dynamic> _data;
  @override
  Map<String, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  @JsonKey()
  final int version;
  @override
  @JsonKey(name: 'app_info')
  final AppInfo? appInfo;

  @override
  String toString() {
    return 'BackupModel(data: $data, version: $version, appInfo: $appInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BackupModelImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.appInfo, appInfo) || other.appInfo == appInfo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_data),
    version,
    appInfo,
  );

  /// Create a copy of BackupModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BackupModelImplCopyWith<_$BackupModelImpl> get copyWith =>
      __$$BackupModelImplCopyWithImpl<_$BackupModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BackupModelImplToJson(
      this,
    );
  }
}

abstract class _BackupModel implements BackupModel {
  factory _BackupModel({
    required final Map<String, dynamic> data,
    final int version,
    @JsonKey(name: 'app_info') final AppInfo? appInfo,
  }) = _$BackupModelImpl;

  factory _BackupModel.fromJson(Map<String, dynamic> json) =
      _$BackupModelImpl.fromJson;

  @override
  Map<String, dynamic> get data;
  @override
  int get version;
  @override
  @JsonKey(name: 'app_info')
  AppInfo? get appInfo;

  /// Create a copy of BackupModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BackupModelImplCopyWith<_$BackupModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
