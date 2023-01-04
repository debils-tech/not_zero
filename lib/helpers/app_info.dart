import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:universal_io/io.dart';

part 'app_info.freezed.dart';
part 'app_info.g.dart';

@freezed
@singleton
class AppInfo with _$AppInfo {
  const factory AppInfo({
    required String name,
    required String platform,
    required String version,
    @JsonKey(name: 'build') required int buildNumber,
  }) = _AppInfo;

  factory AppInfo.fromJson(Map<String, dynamic> json) =>
      _$AppInfoFromJson(json);

  @factoryMethod
  static Future<AppInfo> fromEnviroment() async {
    final packageInfo = await PackageInfo.fromPlatform();

    return AppInfo(
      name: 'Not Zero',
      platform: Platform.operatingSystem,
      version: packageInfo.version,
      buildNumber: int.parse(packageInfo.buildNumber),
    );
  }
}
