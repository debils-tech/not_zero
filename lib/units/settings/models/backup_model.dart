import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:not_zero/helpers/app_info.dart';

part 'backup_model.freezed.dart';
part 'backup_model.g.dart';

@freezed
class BackupModel with _$BackupModel {
  @JsonSerializable(explicitToJson: true)
  factory BackupModel({
    required Map<String, dynamic> data,
    @Default(1) int version,
    AppInfo? appInfo,
  }) = _BackupModel;

  factory BackupModel.fromJson(Map<String, dynamic> json) =>
      _$BackupModelFromJson(json);
}
