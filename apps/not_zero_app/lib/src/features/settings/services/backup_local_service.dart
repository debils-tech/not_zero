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

  Future<void> databaseRestoreFromStream(Stream<Uint8List> dataStream) async =>
      _db.restoreFromStream(dataStream);

  Future<void> settingsRestoreData(Stream<Uint8List> dataStream) async {
    final dataBuiler = BytesBuilder();
    await dataStream.forEach(dataBuiler.add);

    final settingsMap = Map<String, dynamic>.from(
      jsonDecode(utf8.decode(dataBuiler.takeBytes())) as Map,
    );
    await _settingsBox.clearAll();
    for (final entry in settingsMap.entries) {
      final value = entry.value;
      switch (value) {
        case String():
          await _settingsBox.putString(entry.key, value);
        case int():
          await _settingsBox.putInt(entry.key, value);
        case bool():
          await _settingsBox.putBool(entry.key, value);
      }
    }
  }
}
