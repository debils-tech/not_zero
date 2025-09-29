// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ItemTag _$ItemTagFromJson(Map<String, dynamic> json) => _ItemTag(
  id: json['id'] as String,
  name: json['name'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  colorIndex: (json['color'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$ItemTagToJson(_ItemTag instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'createdAt': instance.createdAt.toIso8601String(),
  'color': instance.colorIndex,
};
