import 'dart:convert';
import 'dart:typed_data';

import 'package:not_zero_app/src/helpers/app_info.dart';
import 'package:nz_boxes/nz_boxes.dart';
import 'package:nz_common/nz_common.dart';
import 'package:nz_drift/nz_drift.dart';

class BackupLocalService implements BaseService {
  const BackupLocalService(this._db, this._settingsBox);

  final NotZeroDatabase _db;
  final NotZeroSimpleBox _settingsBox;

  Future<Stream<Uint8List>> databaseBackupStream() => _db.backupToStream();

  Future<Uint8List> settingsBackupData() async =>
      utf8.encode(jsonEncode(_settingsBox.dump()));

  Future<Uint8List> appInfoBackupData() async {
    final appInfo = await AppInfo.fromEnvironment();
    return utf8.encode(jsonEncode(appInfo.toJson()));
  }

  Future<Uint8List> backupInfoData() async => utf8.encode(
    jsonEncode({
      'version': 1,
      'timestamp': DateTime.now().toIso8601String(),
    }),
  );
}
