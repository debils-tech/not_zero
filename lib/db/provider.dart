import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:not_zero/db/db.dart';
export 'db.dart';

@singleton
class StorageProvider {
  final database = NotZeroDatabase();

  final settings = Hive.box<String>('settings');

  static Future<void> initHiveBoxes() async {
    await Hive.initFlutter();
    await Hive.openBox<String>('settings');
  }

  Future<void> deleteFromDisk() async {
    await database.deleteFromDisk();
    await settings.deleteFromDisk();
  }
}
