// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tasks_filters.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$TasksFilters {
  Set<String> get searchTags => throw _privateConstructorUsedError;
  DateTime? get forDate => throw _privateConstructorUsedError;

  /// Create a copy of TasksFilters
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TasksFiltersCopyWith<TasksFilters> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TasksFiltersCopyWith<$Res> {
  factory $TasksFiltersCopyWith(
    TasksFilters value,
    $Res Function(TasksFilters) then,
  ) = _$TasksFiltersCopyWithImpl<$Res, TasksFilters>;
  @useResult
  $Res call({Set<String> searchTags, DateTime? forDate});
}

/// @nodoc
class _$TasksFiltersCopyWithImpl<$Res, $Val extends TasksFilters>
    implements $TasksFiltersCopyWith<$Res> {
  _$TasksFiltersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TasksFilters
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchTags = null,
    Object? forDate = freezed,
  }) {
    return _then(
      _value.copyWith(
            searchTags: null == searchTags
                ? _value.searchTags
                : searchTags // ignore: cast_nullable_to_non_nullable
                      as Set<String>,
            forDate: freezed == forDate
                ? _value.forDate
                : forDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TasksFiltersImplCopyWith<$Res>
    implements $TasksFiltersCopyWith<$Res> {
  factory _$$TasksFiltersImplCopyWith(
    _$TasksFiltersImpl value,
    $Res Function(_$TasksFiltersImpl) then,
  ) = __$$TasksFiltersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Set<String> searchTags, DateTime? forDate});
}

/// @nodoc
class __$$TasksFiltersImplCopyWithImpl<$Res>
    extends _$TasksFiltersCopyWithImpl<$Res, _$TasksFiltersImpl>
    implements _$$TasksFiltersImplCopyWith<$Res> {
  __$$TasksFiltersImplCopyWithImpl(
    _$TasksFiltersImpl _value,
    $Res Function(_$TasksFiltersImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TasksFilters
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchTags = null,
    Object? forDate = freezed,
  }) {
    return _then(
      _$TasksFiltersImpl(
        searchTags: null == searchTags
            ? _value._searchTags
            : searchTags // ignore: cast_nullable_to_non_nullable
                  as Set<String>,
        forDate: freezed == forDate
            ? _value.forDate
            : forDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc

class _$TasksFiltersImpl implements _TasksFilters {
  const _$TasksFiltersImpl({
    final Set<String> searchTags = const <String>{},
    this.forDate,
  }) : _searchTags = searchTags;

  final Set<String> _searchTags;
  @override
  @JsonKey()
  Set<String> get searchTags {
    if (_searchTags is EqualUnmodifiableSetView) return _searchTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_searchTags);
  }

  @override
  final DateTime? forDate;

  @override
  String toString() {
    return 'TasksFilters(searchTags: $searchTags, forDate: $forDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TasksFiltersImpl &&
            const DeepCollectionEquality().equals(
              other._searchTags,
              _searchTags,
            ) &&
            (identical(other.forDate, forDate) || other.forDate == forDate));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_searchTags),
    forDate,
  );

  /// Create a copy of TasksFilters
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TasksFiltersImplCopyWith<_$TasksFiltersImpl> get copyWith =>
      __$$TasksFiltersImplCopyWithImpl<_$TasksFiltersImpl>(this, _$identity);
}

abstract class _TasksFilters implements TasksFilters {
  const factory _TasksFilters({
    final Set<String> searchTags,
    final DateTime? forDate,
  }) = _$TasksFiltersImpl;

  @override
  Set<String> get searchTags;
  @override
  DateTime? get forDate;

  /// Create a copy of TasksFilters
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TasksFiltersImplCopyWith<_$TasksFiltersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
