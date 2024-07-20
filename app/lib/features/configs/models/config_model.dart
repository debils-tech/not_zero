import 'package:freezed_annotation/freezed_annotation.dart';

part 'config_model.freezed.dart';
part 'config_model.g.dart';

@freezed
class ConfigModel with _$ConfigModel {
  const factory ConfigModel({
    required int id,
    required bool enabled,
    required String key,
    required Object data,
  }) = _ConfigModel;

  const ConfigModel._();

  factory ConfigModel.fromJson(Map<String, dynamic> json) =>
      _$ConfigModelFromJson(json);

  Map<String, dynamic> asMap() => data as Map<String, dynamic>;
}
