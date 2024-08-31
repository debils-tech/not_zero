// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppInfoImpl _$$AppInfoImplFromJson(Map<String, dynamic> json) =>
    _$AppInfoImpl(
      name: json['name'] as String,
      platform: json['platform'] as String,
      version: json['version'] as String,
      buildNumber: (json['build'] as num).toInt(),
    );

Map<String, dynamic> _$$AppInfoImplToJson(_$AppInfoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'platform': instance.platform,
      'version': instance.version,
      'build': instance.buildNumber,
    };
