// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'backup_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BackupModel _$BackupModelFromJson(Map<String, dynamic> json) => _BackupModel(
  data: json['data'] as Map<String, dynamic>,
  version: (json['version'] as num?)?.toInt() ?? 1,
  appInfo: json['app_info'] == null
      ? null
      : AppInfo.fromJson(json['app_info'] as Map<String, dynamic>),
);

Map<String, dynamic> _$BackupModelToJson(_BackupModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'version': instance.version,
      'app_info': instance.appInfo?.toJson(),
    };
