// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskImpl _$$TaskImplFromJson(Map<String, dynamic> json) => _$TaskImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      importance: $enumDecode(_$TaskImportanceEnumMap, json['importance']),
      createdAt: DateTime.parse(json['createdAt'] as String),
      forDate: DateTime.parse(json['forDate'] as String),
      description: json['description'] as String? ?? '',
      modifiedAt: json['modifiedAt'] == null
          ? null
          : DateTime.parse(json['modifiedAt'] as String),
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
      persistent: json['persistent'] as bool? ?? false,
    );

Map<String, dynamic> _$$TaskImplToJson(_$TaskImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'importance': _$TaskImportanceEnumMap[instance.importance]!,
      'createdAt': instance.createdAt.toIso8601String(),
      'forDate': instance.forDate.toIso8601String(),
      'description': instance.description,
      'modifiedAt': instance.modifiedAt?.toIso8601String(),
      'completedAt': instance.completedAt?.toIso8601String(),
      'persistent': instance.persistent,
      'tags': Task._tagsToJson(instance.tags),
    };

const _$TaskImportanceEnumMap = {
  TaskImportance.notImportant: 'notImportant',
  TaskImportance.normal: 'normal',
  TaskImportance.important: 'important',
};
