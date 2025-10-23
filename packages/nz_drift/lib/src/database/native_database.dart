// coverage:ignore-file
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:nz_common/nz_common.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

QueryExecutor openDriftDatabase({bool permanent = true}) {
  if (permanent) {
    return LazyDatabase(() async {
      final path = await getDatabasePath();
      final file = File(path!);

      if (_useLogs) {
        print('Open database at "$path"');
      }

      return NativeDatabase(file, logStatements: _useLogs);
    });
  }

  return NativeDatabase.memory(logStatements: _useLogs);
}

Future<String?> getDatabasePath() async {
  final String dbFolder;
  if (Platform.isLinux && !isPlatformTest) {
    dbFolder = p.join(Platform.environment['HOME'] ?? '~', '.config/not_zero');
  } else {
    dbFolder = (await getApplicationDocumentsDirectory()).path;
  }

  return p.join(dbFolder, 'db.sqlite');
}

bool get _useLogs {
  var isInDebug = false;
  assert(
    (() {
      // true only in debug build
      isInDebug = true;
      return true;
    })(),
    'Database should be opened in debug mode',
  );
  return isInDebug;
}
