import 'package:flutter_test/flutter_test.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

const rootPath = 'build/test_root';

void initPaths() {
  TestWidgetsFlutterBinding.ensureInitialized();
  PathProviderPlatform.instance = FakePathProviderPlatform();
}

class FakePathProviderPlatform extends PathProviderPlatform {
  @override
  Future<String?> getApplicationDocumentsPath() => _futurePath('documents');

  @override
  Future<String?> getApplicationSupportPath() => _futurePath('support');

  @override
  Future<String?> getDownloadsPath() => _futurePath('downloads');

  @override
  Future<List<String>?> getExternalCachePaths() =>
      Future.value(['$rootPath/cache']);

  @override
  Future<String?> getExternalStoragePath() => _futurePath('external');

  @override
  Future<List<String>?> getExternalStoragePaths({StorageDirectory? type}) =>
      Future.value(['$rootPath/external']);

  @override
  Future<String?> getLibraryPath() => _futurePath('library');

  @override
  Future<String?> getTemporaryPath() => _futurePath('temp');
}

Future<String> _futurePath(String v) => Future.value('$rootPath/$v');
