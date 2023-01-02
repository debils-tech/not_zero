import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:not_zero/constants/database.dart';
import 'package:not_zero/db/db.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:universal_io/io.dart';

export 'db.dart';

@singleton
class StorageProvider {
  static Future<String> get storageDirectory async {
    if (Platform.isLinux && !Platform.environment.containsKey('FLUTTER_TEST')) {
      return p.join(
        Platform.environment['HOME'] ?? '~',
        '.config/not_zero',
      );
    }

    final dbFolder = await getApplicationDocumentsDirectory();
    return dbFolder.path;
  }

  final database = NotZeroDatabase();

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
