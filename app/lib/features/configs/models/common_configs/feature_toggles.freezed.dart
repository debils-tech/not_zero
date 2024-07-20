// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feature_toggles.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FeatureTogglesConfigModel _$FeatureTogglesConfigModelFromJson(
    Map<String, dynamic> json) {
  return _FeatureTogglesConfigModel.fromJson(json);
}

/// @nodoc
mixin _$FeatureTogglesConfigModel {
  Set<AppFeatures> get features => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FeatureTogglesConfigModelCopyWith<FeatureTogglesConfigModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeatureTogglesConfigModelCopyWith<$Res> {
  factory $FeatureTogglesConfigModelCopyWith(FeatureTogglesConfigModel value,
          $Res Function(FeatureTogglesConfigModel) then) =
      _$FeatureTogglesConfigModelCopyWithImpl<$Res, FeatureTogglesConfigModel>;
  @useResult
  $Res call({Set<AppFeatures> features});
}

/// @nodoc
class _$FeatureTogglesConfigModelCopyWithImpl<$Res,
        $Val extends FeatureTogglesConfigModel>
    implements $FeatureTogglesConfigModelCopyWith<$Res> {
  _$FeatureTogglesConfigModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? features = null,
  }) {
    return _then(_value.copyWith(
      features: null == features
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as Set<AppFeatures>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FeatureTogglesConfigModelImplCopyWith<$Res>
    implements $FeatureTogglesConfigModelCopyWith<$Res> {
  factory _$$FeatureTogglesConfigModelImplCopyWith(
          _$FeatureTogglesConfigModelImpl value,
          $Res Function(_$FeatureTogglesConfigModelImpl) then) =
      __$$FeatureTogglesConfigModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Set<AppFeatures> features});
}

/// @nodoc
class __$$FeatureTogglesConfigModelImplCopyWithImpl<$Res>
    extends _$FeatureTogglesConfigModelCopyWithImpl<$Res,
        _$FeatureTogglesConfigModelImpl>
    implements _$$FeatureTogglesConfigModelImplCopyWith<$Res> {
  __$$FeatureTogglesConfigModelImplCopyWithImpl(
      _$FeatureTogglesConfigModelImpl _value,
      $Res Function(_$FeatureTogglesConfigModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? features = null,
  }) {
    return _then(_$FeatureTogglesConfigModelImpl(
      features: null == features
          ? _value._features
          : features // ignore: cast_nullable_to_non_nullable
              as Set<AppFeatures>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FeatureTogglesConfigModelImpl implements _FeatureTogglesConfigModel {
  const _$FeatureTogglesConfigModelImpl(
      {final Set<AppFeatures> features = const {}})
      : _features = features;

  factory _$FeatureTogglesConfigModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeatureTogglesConfigModelImplFromJson(json);

  final Set<AppFeatures> _features;
  @override
  @JsonKey()
  Set<AppFeatures> get features {
    if (_features is EqualUnmodifiableSetView) return _features;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_features);
  }

  @override
  String toString() {
    return 'FeatureTogglesConfigModel(features: $features)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeatureTogglesConfigModelImpl &&
            const DeepCollectionEquality().equals(other._features, _features));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_features));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FeatureTogglesConfigModelImplCopyWith<_$FeatureTogglesConfigModelImpl>
      get copyWith => __$$FeatureTogglesConfigModelImplCopyWithImpl<
          _$FeatureTogglesConfigModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeatureTogglesConfigModelImplToJson(
      this,
    );
  }
}

abstract class _FeatureTogglesConfigModel implements FeatureTogglesConfigModel {
  const factory _FeatureTogglesConfigModel({final Set<AppFeatures> features}) =
      _$FeatureTogglesConfigModelImpl;

  factory _FeatureTogglesConfigModel.fromJson(Map<String, dynamic> json) =
      _$FeatureTogglesConfigModelImpl.fromJson;

  @override
  Set<AppFeatures> get features;
  @override
  @JsonKey(ignore: true)
  _$$FeatureTogglesConfigModelImplCopyWith<_$FeatureTogglesConfigModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
