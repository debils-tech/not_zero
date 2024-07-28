import 'package:freezed_annotation/freezed_annotation.dart';

part 'feature_toggles.freezed.dart';
part 'feature_toggles.g.dart';

@freezed
class FeatureTogglesConfigModel with _$FeatureTogglesConfigModel {
  const factory FeatureTogglesConfigModel({
    @Default({})
    @JsonKey(unknownEnumValue: AppFeatures.unknown)
    Set<AppFeatures> features,
  }) = _FeatureTogglesConfigModel;

  factory FeatureTogglesConfigModel.fromJson(Map<String, dynamic> json) =>
      _$FeatureTogglesConfigModelFromJson(json);
}

enum AppFeatures {
  unknown,

  planning,

  @JsonValue('server_selection')
  serverSelection,
}
