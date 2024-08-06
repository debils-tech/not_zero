// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feature_toggles.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FeatureTogglesConfigModelImpl _$$FeatureTogglesConfigModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FeatureTogglesConfigModelImpl(
      features: (json['features'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$AppFeaturesEnumMap, e,
                  unknownValue: AppFeatures.unknown))
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
  AppFeatures.unknown: 'unknown',
  AppFeatures.planning: 'planning',
  AppFeatures.serverSelection: 'server_selection',
  AppFeatures.plansDescription: 'plans_description',
  AppFeatures.showPlanCompletionCheckbox: 'show_plan_completion_checkbox',
};
