// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feature_toggles.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FeatureTogglesConfigModelImpl _$$FeatureTogglesConfigModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FeatureTogglesConfigModelImpl(
      features: (json['features'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$AppFeaturesEnumMap, e))
              .toSet() ??
          const {},
    );

Map<String, dynamic> _$$FeatureTogglesConfigModelImplToJson(
        _$FeatureTogglesConfigModelImpl instance) =>
    <String, dynamic>{
      'features':
          instance.features.map((e) => _$AppFeaturesEnumMap[e]!).toList(),
    };

const _$AppFeaturesEnumMap = {
  AppFeatures.planning: 'planning',
};
