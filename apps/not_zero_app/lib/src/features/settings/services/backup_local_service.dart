// Not Zero, cross-platform wellbeing application.
// Copyright (C) 2025 Nagorny Vladislav
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

import 'dart:convert';
import 'dart:typed_data';

import 'package:not_zero_app/src/helpers/app_info.dart';
import 'package:nz_boxes/nz_boxes.dart';
import 'package:nz_common/nz_common.dart';
import 'package:nz_drift/nz_drift.dart';

class BackupLocalService implements BaseService {
  const BackupLocalService(this._db, this._settingsBox, this._tempBox);

  final NotZeroDatabase _db;
  final NotZeroSimpleBox _settingsBox;
  final NotZeroSimpleBox _tempBox;

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

  Future<void> clearTempBox() async => _tempBox.clearAll();
}
