// Not Zero, cross-platform wellbeing application.
// Copyright (C) 2025 Nagorny Vladislav
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:not_zero_app/src/helpers/app_info.dart';

part 'backup_model.freezed.dart';
part 'backup_model.g.dart';

@freezed
abstract class BackupModel with _$BackupModel {
  @JsonSerializable(explicitToJson: true)
  factory BackupModel({
    required Map<String, dynamic> data,
    @Default(1) int version,
    @JsonKey(name: 'app_info') AppInfo? appInfo,
  }) = _BackupModel;

  factory BackupModel.fromJson(Map<String, dynamic> json) =>
      _$BackupModelFromJson(json);
}
