import 'package:flutter_test/flutter_test.dart';
import 'package:package_info_plus_platform_interface/package_info_data.dart';
import 'package:package_info_plus_platform_interface/package_info_platform_interface.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:uuid/uuid.dart';

const rootPath = 'build/test_root';

void initPaths() {
  PathProviderPlatform.instance = FakePathProviderPlatform();
}

void initPackageInfo() {
  PackageInfoPlatform.instance = FakePackageInfoPlatform();
}

class FakePathProviderPlatform extends PathProviderPlatform {
  FakePathProviderPlatform() : _randSubdirectory = const Uuid().v4();

  final String _randSubdirectory;

  @override
  Future<String?> getApplicationDocumentsPath() =>
      _futurePath('$_randSubdirectory/documents');

  @override
  Future<String?> getApplicationSupportPath() =>
      _futurePath('$_randSubdirectory/support');

  @override
  Future<String?> getDownloadsPath() =>
      _futurePath('$_randSubdirectory/downloads');

  @override
  Future<List<String>?> getExternalCachePaths() =>
      Future.value(['$rootPath/$_randSubdirectory/cache']);

  @override
  Future<String?> getExternalStoragePath() =>
      _futurePath('$_randSubdirectory/external');

  @override
  Future<List<String>?> getExternalStoragePaths({StorageDirectory? type}) =>
      Future.value(['$rootPath/$_randSubdirectory/external']);

  @override
  Future<String?> getLibraryPath() => _futurePath('$_randSubdirectory/library');

  @override
  Future<String?> getTemporaryPath() => _futurePath('$_randSubdirectory/temp');
}

Future<String> _futurePath(String v) => Future.value('$rootPath/$v');

class FakePackageInfoPlatform extends PackageInfoPlatform {
  @override
  Future<PackageInfoData> getAll() async {
    return PackageInfoData(
      appName: 'Not Zero Test',
      version: '0.0.0',
      buildNumber: '0',
      packageName: 'not_zero',
      buildSignature: '',
    );
  }
}
