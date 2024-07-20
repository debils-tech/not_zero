// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plans_filter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlansFilterModelImpl _$$PlansFilterModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PlansFilterModelImpl(
      forDate: DateTime.parse(json['forDate'] as String),
    );

Map<String, dynamic> _$$PlansFilterModelImplToJson(
        _$PlansFilterModelImpl instance) =>
    <String, dynamic>{
      'forDate': instance.forDate.toIso8601String(),
    };
