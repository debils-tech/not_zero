// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Habit _$HabitFromJson(Map<String, dynamic> json) => _Habit(
  id: json['id'] as String,
  title: json['title'] as String,
  description: json['description'] as String? ?? '',
  importance:
      $enumDecodeNullable(_$TaskImportanceEnumMap, json['importance']) ??
      TaskImportance.normal,
  createdAt: DateTime.parse(json['createdAt'] as String),
  modifiedAt: json['modifiedAt'] == null
      ? null
      : DateTime.parse(json['modifiedAt'] as String),
  completions:
      (json['completions'] as List<dynamic>?)
          ?.map((e) => HabitCompletion.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  regularity: json['regularity'] == null
      ? const HabitRegularity.daily()
      : HabitRegularity.fromJson(json['regularity'] as Map<String, dynamic>),
);

Map<String, dynamic> _$HabitToJson(_Habit instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'importance': _$TaskImportanceEnumMap[instance.importance]!,
  'createdAt': instance.createdAt.toIso8601String(),
  'modifiedAt': instance.modifiedAt?.toIso8601String(),
  'completions': Habit._completionsToJson(instance.completions),
  'regularity': instance.regularity,
};

const _$TaskImportanceEnumMap = {
  TaskImportance.notImportant: 'notImportant',
  TaskImportance.normal: 'normal',
  TaskImportance.important: 'important',
};
