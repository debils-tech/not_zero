import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:not_zero/helpers/file_helper.dart';
import 'package:package_info_plus_platform_interface/package_info_data.dart';
import 'package:package_info_plus_platform_interface/package_info_platform_interface.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:uuid/uuid.dart';

final _rootPath = 'build/test_root/${const Uuid().v4()}';

void initPaths() {
  PathProviderPlatform.instance = FakePathProviderPlatform();
}

void initPackageInfo() {
  PackageInfoPlatform.instance = FakePackageInfoPlatform();
}

void initFileHelper() {
  MultiplatformFileHelper.instance = FakeFileHelper();
}

class FakePathProviderPlatform extends PathProviderPlatform {
  FakePathProviderPlatform();

  @override
  Future<String?> getApplicationDocumentsPath() => _futurePath('documents');

  @override
  Future<String?> getApplicationSupportPath() => _futurePath('support');

  @override
  Future<String?> getDownloadsPath() => _futurePath('downloads');

  @override
  Future<List<String>?> getExternalCachePaths() =>
      Future.value(['$_rootPath/cache']);

  @override
  Future<String?> getExternalStoragePath() => _futurePath('external');

  @override
  Future<List<String>?> getExternalStoragePaths({StorageDirectory? type}) =>
      Future.value(['$_rootPath/external']);

  @override
  Future<String?> getLibraryPath() => _futurePath('library');

  @override
  Future<String?> getTemporaryPath() => _futurePath('temp');
}

Future<String> _futurePath(String v) => Future.value('$_rootPath/$v');

class FakePackageInfoPlatform extends PackageInfoPlatform {
  @override
  Future<PackageInfoData> getAll({String? baseUrl}) async {
    return PackageInfoData(
      appName: 'Not Zero Test',
      version: '0.0.0',
      buildNumber: '0',
      packageName: 'not_zero',
      buildSignature: '',
    );
  }
}

class FakeFileHelper implements MultiplatformFileHelper {
  @override
  Future<bool> saveFile({
    required Uint8List data,
    required String fileName,
    required String mimetype,
    required List<String> allowedExtensions,
  }) {
    if (fileName.isEmpty) return Future.value(false);

    try {
      final file = File('$_rootPath/test_file.bin');
      file.createSync(recursive: true);
      file.writeAsBytesSync(data);
      return Future.value(true);
    } catch (_) {
      return Future.value(false);
    }
  }

  @override
  Future<Uint8List?> loadFile({required List<String> allowedExtensions}) {
    try {
      final file = File('$_rootPath/test_file.bin');
      return file.readAsBytes();
    } catch (_) {
      return Future.value();
    }
  }
}
