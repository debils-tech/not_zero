// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'habit_regularity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
HabitRegularity _$HabitRegularityFromJson(
  Map<String, dynamic> json
) {
        switch (json['type']) {
                  case 'daily':
          return DailyHabitRegularity.fromJson(
            json
          );
                case 'timesPerWeek':
          return TimesPerWeekHabitRegularity.fromJson(
            json
          );
                case 'atWeekdays':
          return AtWeekdaysHabitRegularity.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'type',
  'HabitRegularity',
  'Invalid union type "${json['type']}"!'
);
        }
      
}

/// @nodoc
mixin _$HabitRegularity {



  /// Serializes this HabitRegularity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HabitRegularity);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HabitRegularity()';
}


}

/// @nodoc
class $HabitRegularityCopyWith<$Res>  {
$HabitRegularityCopyWith(HabitRegularity _, $Res Function(HabitRegularity) __);
}


/// Adds pattern-matching-related methods to [HabitRegularity].
extension HabitRegularityPatterns on HabitRegularity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( DailyHabitRegularity value)?  daily,TResult Function( TimesPerWeekHabitRegularity value)?  timesPerWeek,TResult Function( AtWeekdaysHabitRegularity value)?  atWeekdays,required TResult orElse(),}){
final _that = this;
switch (_that) {
case DailyHabitRegularity() when daily != null:
return daily(_that);case TimesPerWeekHabitRegularity() when timesPerWeek != null:
return timesPerWeek(_that);case AtWeekdaysHabitRegularity() when atWeekdays != null:
return atWeekdays(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( DailyHabitRegularity value)  daily,required TResult Function( TimesPerWeekHabitRegularity value)  timesPerWeek,required TResult Function( AtWeekdaysHabitRegularity value)  atWeekdays,}){
final _that = this;
switch (_that) {
case DailyHabitRegularity():
return daily(_that);case TimesPerWeekHabitRegularity():
return timesPerWeek(_that);case AtWeekdaysHabitRegularity():
return atWeekdays(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( DailyHabitRegularity value)?  daily,TResult? Function( TimesPerWeekHabitRegularity value)?  timesPerWeek,TResult? Function( AtWeekdaysHabitRegularity value)?  atWeekdays,}){
final _that = this;
switch (_that) {
case DailyHabitRegularity() when daily != null:
return daily(_that);case TimesPerWeekHabitRegularity() when timesPerWeek != null:
return timesPerWeek(_that);case AtWeekdaysHabitRegularity() when atWeekdays != null:
return atWeekdays(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  daily,TResult Function( int times)?  timesPerWeek,TResult Function( List<int> weekdays)?  atWeekdays,required TResult orElse(),}) {final _that = this;
switch (_that) {
case DailyHabitRegularity() when daily != null:
return daily();case TimesPerWeekHabitRegularity() when timesPerWeek != null:
return timesPerWeek(_that.times);case AtWeekdaysHabitRegularity() when atWeekdays != null:
return atWeekdays(_that.weekdays);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  daily,required TResult Function( int times)  timesPerWeek,required TResult Function( List<int> weekdays)  atWeekdays,}) {final _that = this;
switch (_that) {
case DailyHabitRegularity():
return daily();case TimesPerWeekHabitRegularity():
return timesPerWeek(_that.times);case AtWeekdaysHabitRegularity():
return atWeekdays(_that.weekdays);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  daily,TResult? Function( int times)?  timesPerWeek,TResult? Function( List<int> weekdays)?  atWeekdays,}) {final _that = this;
switch (_that) {
case DailyHabitRegularity() when daily != null:
return daily();case TimesPerWeekHabitRegularity() when timesPerWeek != null:
return timesPerWeek(_that.times);case AtWeekdaysHabitRegularity() when atWeekdays != null:
return atWeekdays(_that.weekdays);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class DailyHabitRegularity implements HabitRegularity {
  const DailyHabitRegularity({final  String? $type}): $type = $type ?? 'daily';
  factory DailyHabitRegularity.fromJson(Map<String, dynamic> json) => _$DailyHabitRegularityFromJson(json);



@JsonKey(name: 'type')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$DailyHabitRegularityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyHabitRegularity);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HabitRegularity.daily()';
}


}




/// @nodoc
@JsonSerializable()

class TimesPerWeekHabitRegularity implements HabitRegularity {
  const TimesPerWeekHabitRegularity(this.times, {final  String? $type}): $type = $type ?? 'timesPerWeek';
  factory TimesPerWeekHabitRegularity.fromJson(Map<String, dynamic> json) => _$TimesPerWeekHabitRegularityFromJson(json);

 final  int times;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of HabitRegularity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimesPerWeekHabitRegularityCopyWith<TimesPerWeekHabitRegularity> get copyWith => _$TimesPerWeekHabitRegularityCopyWithImpl<TimesPerWeekHabitRegularity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TimesPerWeekHabitRegularityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimesPerWeekHabitRegularity&&(identical(other.times, times) || other.times == times));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,times);

@override
String toString() {
  return 'HabitRegularity.timesPerWeek(times: $times)';
}


}

/// @nodoc
abstract mixin class $TimesPerWeekHabitRegularityCopyWith<$Res> implements $HabitRegularityCopyWith<$Res> {
  factory $TimesPerWeekHabitRegularityCopyWith(TimesPerWeekHabitRegularity value, $Res Function(TimesPerWeekHabitRegularity) _then) = _$TimesPerWeekHabitRegularityCopyWithImpl;
@useResult
$Res call({
 int times
});




}
/// @nodoc
class _$TimesPerWeekHabitRegularityCopyWithImpl<$Res>
    implements $TimesPerWeekHabitRegularityCopyWith<$Res> {
  _$TimesPerWeekHabitRegularityCopyWithImpl(this._self, this._then);

  final TimesPerWeekHabitRegularity _self;
  final $Res Function(TimesPerWeekHabitRegularity) _then;

/// Create a copy of HabitRegularity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? times = null,}) {
  return _then(TimesPerWeekHabitRegularity(
null == times ? _self.times : times // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
@JsonSerializable()

class AtWeekdaysHabitRegularity implements HabitRegularity {
  const AtWeekdaysHabitRegularity(final  List<int> weekdays, {final  String? $type}): _weekdays = weekdays,$type = $type ?? 'atWeekdays';
  factory AtWeekdaysHabitRegularity.fromJson(Map<String, dynamic> json) => _$AtWeekdaysHabitRegularityFromJson(json);

 final  List<int> _weekdays;
 List<int> get weekdays {
  if (_weekdays is EqualUnmodifiableListView) return _weekdays;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_weekdays);
}


@JsonKey(name: 'type')
final String $type;


/// Create a copy of HabitRegularity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AtWeekdaysHabitRegularityCopyWith<AtWeekdaysHabitRegularity> get copyWith => _$AtWeekdaysHabitRegularityCopyWithImpl<AtWeekdaysHabitRegularity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AtWeekdaysHabitRegularityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AtWeekdaysHabitRegularity&&const DeepCollectionEquality().equals(other._weekdays, _weekdays));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_weekdays));

@override
String toString() {
  return 'HabitRegularity.atWeekdays(weekdays: $weekdays)';
}


}

/// @nodoc
abstract mixin class $AtWeekdaysHabitRegularityCopyWith<$Res> implements $HabitRegularityCopyWith<$Res> {
  factory $AtWeekdaysHabitRegularityCopyWith(AtWeekdaysHabitRegularity value, $Res Function(AtWeekdaysHabitRegularity) _then) = _$AtWeekdaysHabitRegularityCopyWithImpl;
@useResult
$Res call({
 List<int> weekdays
});




}
/// @nodoc
class _$AtWeekdaysHabitRegularityCopyWithImpl<$Res>
    implements $AtWeekdaysHabitRegularityCopyWith<$Res> {
  _$AtWeekdaysHabitRegularityCopyWithImpl(this._self, this._then);

  final AtWeekdaysHabitRegularity _self;
  final $Res Function(AtWeekdaysHabitRegularity) _then;

/// Create a copy of HabitRegularity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? weekdays = null,}) {
  return _then(AtWeekdaysHabitRegularity(
null == weekdays ? _self._weekdays : weekdays // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}


}

// dart format on
