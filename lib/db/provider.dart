import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:not_zero/constants/database.dart';
import 'package:not_zero/db/db.dart';
import 'package:not_zero/db/drift/open_database.dart';
import 'package:nz_common/nz_common.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:universal_io/io.dart';

export 'package:hive_flutter/hive_flutter.dart';
export 'db.dart';

@singleton
class StorageProvider {
  static Future<String> get storageDirectory async {
    if (Platform.isLinux && !isPlatformTest) {
      return p.join(
        Platform.environment['HOME'] ?? '~',
        '.config/not_zero',
      );
    }

    final dbFolder = await getApplicationDocumentsDirectory();
    return dbFolder.path;
  }

  final database = _getLazyDriftDb();

  final settings = Hive.box<String>(BoxNames.settings);

  static Future<void> initHiveBoxes() async {
    await Hive.initFlutter(await storageDirectory);
    await Hive.openBox<String>(BoxNames.settings);
  }

  Future<void> deleteFromDisk() async {
    await database.deleteFromDisk();
    await settings.deleteFromDisk();
  }
}

NotZeroDatabase _getLazyDriftDb() {
  if (kIsWeb) {
    // Web doesn't support dart isolates.
    // Otherwise you will have this error:
    //
    // Error: Unsupported operation: dart:isolate is not supported on dart4web
    return NotZeroDatabase();
  }

  if (isPlatformTest) {
    // It will be generaly better to run test on faster database.
    //
    // Also it helps to avoid problems with complex things like drift isolates.
    return NotZeroDatabase.memory();
  }

  return NotZeroDatabase.connect(openIsolateConnection());
}
