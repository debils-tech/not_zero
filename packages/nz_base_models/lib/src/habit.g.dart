// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Habit _$HabitFromJson(Map<String, dynamic> json) => _Habit(
  id: json['id'] as String,
  title: json['title'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  description: json['description'] as String? ?? '',
  importance:
      $enumDecodeNullable(_$TaskImportanceEnumMap, json['importance']) ??
      TaskImportance.normal,
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
  tags:
      (json['tags'] as List<dynamic>?)
          ?.map((e) => ItemTag.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$HabitToJson(_Habit instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'createdAt': instance.createdAt.toIso8601String(),
  'description': instance.description,
  'importance': _$TaskImportanceEnumMap[instance.importance]!,
  'modifiedAt': instance.modifiedAt?.toIso8601String(),
  'completions': Habit._completionsToJson(instance.completions),
  'regularity': instance.regularity,
  'tags': ItemTag.tagsToIds(instance.tags),
};

const _$TaskImportanceEnumMap = {
  TaskImportance.notImportant: 'notImportant',
  TaskImportance.normal: 'normal',
  TaskImportance.important: 'important',
};
