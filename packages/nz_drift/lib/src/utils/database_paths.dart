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

// coverage:ignore-file
import 'dart:io';

import 'package:nz_common/nz_common.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

Future<String> getDatabasePath() async {
  final String dbFolder;
  if (Platform.isLinux && !isPlatformTest) {
    dbFolder = p.join(Platform.environment['HOME'] ?? '~', '.config/not_zero');
  } else {
    dbFolder = (await getApplicationDocumentsDirectory()).path;
  }

  return p.join(dbFolder, 'db.sqlite');
}

Future<String> getBackupDatabasePath() async {
  final cacheDirectory = await getTemporaryDirectory();
  final timestamp = DateTime.now().millisecondsSinceEpoch;
  final backupPath = p.join(
    cacheDirectory.path,
    'nz-db-backup-$timestamp.sqlite',
  );
  return backupPath;
}
