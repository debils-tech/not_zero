// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_plan_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DailyPlanModelImpl _$$DailyPlanModelImplFromJson(Map<String, dynamic> json) =>
    _$DailyPlanModelImpl(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      forDate: DateTime.parse(json['for_date'] as String),
      title: json['title'] as String,
      description: json['description'] as String? ?? '',
      completedAt: json['completed_at'] == null
          ? null
          : DateTime.parse(json['completed_at'] as String),
    );

Map<String, dynamic> _$$DailyPlanModelImplToJson(
        _$DailyPlanModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'for_date': instance.forDate.toIso8601String(),
      'title': instance.title,
      'description': instance.description,
      'completed_at': instance.completedAt?.toIso8601String(),
    };

_$DailyPlanModelInsertImpl _$$DailyPlanModelInsertImplFromJson(
        Map<String, dynamic> json) =>
    _$DailyPlanModelInsertImpl(
      forDate: DateTime.parse(json['for_date'] as String),
      title: json['title'] as String,
      description: json['description'] as String? ?? '',
      completedAt: json['completed_at'] == null
          ? null
          : DateTime.parse(json['completed_at'] as String),
    );

Map<String, dynamic> _$$DailyPlanModelInsertImplToJson(
        _$DailyPlanModelInsertImpl instance) =>
    <String, dynamic>{
      'for_date': instance.forDate.toIso8601String(),
      'title': instance.title,
      'description': instance.description,
      'completed_at': instance.completedAt?.toIso8601String(),
    };
