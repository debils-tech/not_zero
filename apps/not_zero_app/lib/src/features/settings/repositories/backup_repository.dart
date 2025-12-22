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
      return byteBulder.toBytes();
    } on Object catch (e, s) {
      Logger('BackupRepository').severe('Failed to backup local data', e, s);
      return null;
    }
  }
}
