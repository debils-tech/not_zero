// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plans_filter_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PlansFilterModel _$PlansFilterModelFromJson(Map<String, dynamic> json) {
  return _PlansFilterModel.fromJson(json);
}

/// @nodoc
mixin _$PlansFilterModel {
  DateTime get forDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlansFilterModelCopyWith<PlansFilterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlansFilterModelCopyWith<$Res> {
  factory $PlansFilterModelCopyWith(
          PlansFilterModel value, $Res Function(PlansFilterModel) then) =
      _$PlansFilterModelCopyWithImpl<$Res, PlansFilterModel>;
  @useResult
  $Res call({DateTime forDate});
}

/// @nodoc
class _$PlansFilterModelCopyWithImpl<$Res, $Val extends PlansFilterModel>
    implements $PlansFilterModelCopyWith<$Res> {
  _$PlansFilterModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? forDate = null,
  }) {
    return _then(_value.copyWith(
      forDate: null == forDate
          ? _value.forDate
          : forDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlansFilterModelImplCopyWith<$Res>
    implements $PlansFilterModelCopyWith<$Res> {
  factory _$$PlansFilterModelImplCopyWith(_$PlansFilterModelImpl value,
          $Res Function(_$PlansFilterModelImpl) then) =
      __$$PlansFilterModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime forDate});
}

/// @nodoc
class __$$PlansFilterModelImplCopyWithImpl<$Res>
    extends _$PlansFilterModelCopyWithImpl<$Res, _$PlansFilterModelImpl>
    implements _$$PlansFilterModelImplCopyWith<$Res> {
  __$$PlansFilterModelImplCopyWithImpl(_$PlansFilterModelImpl _value,
      $Res Function(_$PlansFilterModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? forDate = null,
  }) {
    return _then(_$PlansFilterModelImpl(
      forDate: null == forDate
          ? _value.forDate
          : forDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlansFilterModelImpl implements _PlansFilterModel {
  const _$PlansFilterModelImpl({required this.forDate});

  factory _$PlansFilterModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlansFilterModelImplFromJson(json);

  @override
  final DateTime forDate;

  @override
  String toString() {
    return 'PlansFilterModel(forDate: $forDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlansFilterModelImpl &&
            (identical(other.forDate, forDate) || other.forDate == forDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, forDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlansFilterModelImplCopyWith<_$PlansFilterModelImpl> get copyWith =>
      __$$PlansFilterModelImplCopyWithImpl<_$PlansFilterModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlansFilterModelImplToJson(
      this,
    );
  }
}

abstract class _PlansFilterModel implements PlansFilterModel {
  const factory _PlansFilterModel({required final DateTime forDate}) =
      _$PlansFilterModelImpl;

  factory _PlansFilterModel.fromJson(Map<String, dynamic> json) =
      _$PlansFilterModelImpl.fromJson;

  @override
  DateTime get forDate;
  @override
  @JsonKey(ignore: true)
  _$$PlansFilterModelImplCopyWith<_$PlansFilterModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
