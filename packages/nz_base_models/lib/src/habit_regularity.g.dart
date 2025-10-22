// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_regularity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyHabitRegularity _$DailyHabitRegularityFromJson(
  Map<String, dynamic> json,
) => DailyHabitRegularity($type: json['type'] as String?);

Map<String, dynamic> _$DailyHabitRegularityToJson(
  DailyHabitRegularity instance,
) => <String, dynamic>{'type': instance.$type};

TimesPerWeekHabitRegularity _$TimesPerWeekHabitRegularityFromJson(
  Map<String, dynamic> json,
) => TimesPerWeekHabitRegularity(
  (json['times'] as num).toInt(),
  $type: json['type'] as String?,
);

Map<String, dynamic> _$TimesPerWeekHabitRegularityToJson(
  TimesPerWeekHabitRegularity instance,
) => <String, dynamic>{'times': instance.times, 'type': instance.$type};

AtWeekdaysHabitRegularity _$AtWeekdaysHabitRegularityFromJson(
  Map<String, dynamic> json,
) => AtWeekdaysHabitRegularity(
  (json['weekdays'] as List<dynamic>).map((e) => (e as num).toInt()).toList(),
  $type: json['type'] as String?,
);

Map<String, dynamic> _$AtWeekdaysHabitRegularityToJson(
  AtWeekdaysHabitRegularity instance,
) => <String, dynamic>{'weekdays': instance.weekdays, 'type': instance.$type};
