import 'package:hive_flutter/hive_flutter.dart';
import 'package:not_zero/db/db.dart';
export 'db.dart';

class StorageProvider {
  final database = NotZeroDatabase();

  late final Box<String> settings;

  Future<void> init() async {
    await Hive.initFlutter();
    settings = await Hive.openBox<String>('settings');
  }
}
