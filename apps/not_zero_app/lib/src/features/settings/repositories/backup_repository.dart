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

import 'dart:io';
import 'dart:typed_data';

import 'package:logging/logging.dart';
import 'package:not_zero_app/src/features/settings/services/backup_local_service.dart';
import 'package:nz_common/nz_common.dart';
import 'package:tar/tar.dart';

class BackupRepository implements BaseRepository {
  const BackupRepository(this._localService);

  final BackupLocalService _localService;

  static const _dbBackupEntryName = 'db.sqlite';
  static const _settingsBackupEntryName = 'settings.json';
  static const _appInfoBackupEntryName = 'app_info.json';
  static const _backupInfoBackupEntryName = 'backup_info.json';

  Future<Uint8List?> backupLocalData() async {
    final dbEntry = _localService.databaseBackupStream().then(
      (stream) => TarEntry(
        TarHeader(name: _dbBackupEntryName, mode: 0x777),
        stream,
      ),
    );
    final settingsEntry = _localService.settingsBackupData().then(
      (data) => TarEntry.data(
        TarHeader(name: _settingsBackupEntryName, mode: 0x777),
        data,
      ),
    );
    final appInfoEntry = _localService.appInfoBackupData().then(
      (data) => TarEntry.data(
        TarHeader(name: _appInfoBackupEntryName, mode: 0x777),
        data,
      ),
    );
    final backupInfoEntry = _localService.backupInfoData().then(
      (data) => TarEntry.data(
        TarHeader(name: _backupInfoBackupEntryName, mode: 0x777),
        data,
      ),
    );
    final tarByteStream = Stream.fromFutures([
      dbEntry,
      settingsEntry,
      appInfoEntry,
      backupInfoEntry,
    ]).transform(tarWriter).transform(gzip.encoder);

    try {
      // Combining all the byte data into a single Uint8List
      final byteBulder = BytesBuilder();
      await tarByteStream.forEach(byteBulder.add);
      return byteBulder.takeBytes();
    } on Object catch (e, s) {
      Logger('BackupRepository').severe('Failed to backup local data', e, s);
      return null;
    }
  }

  Future<bool> restoreLocalData(Uint8List data) async {
    final tarStream = Stream<List<int>>.value(data).transform(gzip.decoder);
    final reader = TarReader(tarStream);

    try {
      var restoredAnything = false;

      while (await reader.moveNext()) {
        final entry = reader.current;
        final fileData = entry.contents.map(Uint8List.fromList);

        switch (entry.header.name) {
          case _dbBackupEntryName:
            await _localService.databaseRestoreFromStream(fileData);
            restoredAnything = true;
          case _settingsBackupEntryName:
            await _localService.settingsRestoreData(fileData);
            restoredAnything = true;
        }
      }

      await _localService.clearTempBox();

      return restoredAnything;
    } on Object catch (e, s) {
      await reader.cancel();
      Logger('BackupRepository').severe('Failed to restore local data', e, s);
      return false;
    }
  }
}
