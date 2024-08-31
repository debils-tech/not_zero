// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'backup_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BackupModelImpl _$$BackupModelImplFromJson(Map<String, dynamic> json) =>
    _$BackupModelImpl(
      data: json['data'] as Map<String, dynamic>,
      version: (json['version'] as num?)?.toInt() ?? 1,
      appInfo: json['app_info'] == null
          ? null
          : AppInfo.fromJson(json['app_info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$BackupModelImplToJson(_$BackupModelImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'version': instance.version,
      'app_info': instance.appInfo?.toJson(),
    };
