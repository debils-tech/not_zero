// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskImpl _$$TaskImplFromJson(Map<String, dynamic> json) => _$TaskImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      importance: $enumDecode(_$TaskImportanceEnumMap, json['importance']),
      createdAt: DateTime.parse(json['created_at'] as String),
      forDate: DateTime.parse(json['for_date'] as String),
      description: json['description'] as String? ?? '',
      modifiedAt: json['modified_at'] == null
          ? null
          : DateTime.parse(json['modified_at'] as String),
      completedAt: json['completed_at'] == null
          ? null
          : DateTime.parse(json['completed_at'] as String),
      persistent: json['persistent'] as bool? ?? true,
    );

Map<String, dynamic> _$$TaskImplToJson(_$TaskImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'importance': _$TaskImportanceEnumMap[instance.importance]!,
      'created_at': instance.createdAt.toIso8601String(),
      'for_date': instance.forDate.toIso8601String(),
      'description': instance.description,
      'modified_at': instance.modifiedAt?.toIso8601String(),
      'completed_at': instance.completedAt?.toIso8601String(),
      'persistent': instance.persistent,
      'tags': Task._tagsToJson(instance.tags),
    };

const _$TaskImportanceEnumMap = {
  TaskImportance.notImportant: 'notImportant',
  TaskImportance.normal: 'normal',
  TaskImportance.important: 'important',
};
