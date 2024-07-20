// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConfigModelImpl _$$ConfigModelImplFromJson(Map<String, dynamic> json) =>
    _$ConfigModelImpl(
      id: (json['id'] as num).toInt(),
      enabled: json['enabled'] as bool,
      key: json['key'] as String,
      data: json['data'] as Object,
    );

Map<String, dynamic> _$$ConfigModelImplToJson(_$ConfigModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'enabled': instance.enabled,
      'key': instance.key,
      'data': instance.data,
    };
