// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppInfo _$AppInfoFromJson(Map<String, dynamic> json) => _AppInfo(
  name: json['name'] as String,
  platform: json['platform'] as String,
  version: json['version'] as String,
  buildNumber: (json['build'] as num).toInt(),
);

Map<String, dynamic> _$AppInfoToJson(_AppInfo instance) => <String, dynamic>{
  'name': instance.name,
  'platform': instance.platform,
  'version': instance.version,
  'build': instance.buildNumber,
};
