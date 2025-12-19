import 'dart:io';

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

  Future<void> backupLocalData(File backupFile) async {
    final dbEntry = _localService.databaseBackupStream().then(
      (stream) => TarEntry(
        TarHeader(name: _dbBackupEntryName, mode: 0x644),
        stream,
      ),
    );
    final settingsEntry = _localService.settingsBackupData().then(
      (data) => TarEntry.data(
        TarHeader(name: _settingsBackupEntryName, mode: 0x644),
        data,
      ),
    );
    final appInfoEntry = _localService.appInfoBackupData().then(
      (data) => TarEntry.data(
        TarHeader(name: _appInfoBackupEntryName, mode: 0x644),
        data,
      ),
    );
    final backupInfoEntry = _localService.backupInfoData().then(
      (data) => TarEntry.data(
        TarHeader(name: _backupInfoBackupEntryName, mode: 0x644),
        data,
      ),
    );
    final tarByteStream = Stream.fromFutures([
      dbEntry,
      settingsEntry,
      appInfoEntry,
      backupInfoEntry,
    ]).transform(tarWriter).transform(gzip.encoder);

    // Writing all the data to the backup file
    final fileSink = backupFile.openWrite();
    await tarByteStream.pipe(fileSink);
    // Flushing and closing the file
    await fileSink.flush();
    await fileSink.close();
  }
}
