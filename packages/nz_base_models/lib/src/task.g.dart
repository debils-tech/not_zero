// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Task _$TaskFromJson(Map<String, dynamic> json) => _Task(
  id: json['id'] as String,
  title: json['title'] as String,
  importance: $enumDecode(_$TaskImportanceEnumMap, json['importance']),
  createdAt: DateTime.parse(json['createdAt'] as String),
  description: json['description'] as String? ?? '',
  modifiedAt: json['modifiedAt'] == null
      ? null
      : DateTime.parse(json['modifiedAt'] as String),
  completedAt: json['completedAt'] == null
      ? null
      : DateTime.parse(json['completedAt'] as String),
  canceledAt: json['canceledAt'] == null
      ? null
      : DateTime.parse(json['canceledAt'] as String),
  forDate: json['forDate'] == null
      ? null
      : DateTime.parse(json['forDate'] as String),
  persistent: json['persistent'] as bool? ?? true,
  tags:
      (json['tags'] as List<dynamic>?)
          ?.map((e) => ItemTag.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$TaskToJson(_Task instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'importance': _$TaskImportanceEnumMap[instance.importance]!,
  'createdAt': instance.createdAt.toIso8601String(),
  'description': instance.description,
  'modifiedAt': instance.modifiedAt?.toIso8601String(),
  'completedAt': instance.completedAt?.toIso8601String(),
  'canceledAt': instance.canceledAt?.toIso8601String(),
  'forDate': instance.forDate?.toIso8601String(),
  'persistent': instance.persistent,
  'tags': Task._tagsToJson(instance.tags),
};

const _$TaskImportanceEnumMap = {
  TaskImportance.notImportant: 'notImportant',
  TaskImportance.normal: 'normal',
  TaskImportance.important: 'important',
};
