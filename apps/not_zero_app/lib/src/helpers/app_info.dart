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

import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:package_info_plus/package_info_plus.dart';

part 'app_info.freezed.dart';
part 'app_info.g.dart';

@freezed
abstract class AppInfo with _$AppInfo {
  const factory AppInfo({
    required String name,
    required String platform,
    required String version,
    @JsonKey(name: 'build') required int buildNumber,
  }) = _AppInfo;

  factory AppInfo.fromJson(Map<String, dynamic> json) =>
      _$AppInfoFromJson(json);

  static Future<AppInfo> fromEnvironment() async {
    final packageInfo = await PackageInfo.fromPlatform();

    return AppInfo(
      name: 'Not Zero',
      platform: Platform.operatingSystem,
      version: packageInfo.version,
      buildNumber: int.tryParse(packageInfo.buildNumber) ?? 0,
    );
  }
}
