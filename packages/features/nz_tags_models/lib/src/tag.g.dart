// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemTagImpl _$$ItemTagImplFromJson(Map<String, dynamic> json) =>
    _$ItemTagImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      colorIndex: (json['color'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$ItemTagImplToJson(_$ItemTagImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'created_at': instance.createdAt.toIso8601String(),
      'color': instance.colorIndex,
    };
