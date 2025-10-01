// coverage:ignore-file
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/foundation.dart';
import 'package:nz_common/nz_common.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

QueryExecutor openDriftDatabase({bool permanent = true}) {
  if (permanent) {
    return LazyDatabase(() async {
      final path = await getDatabasePath();
      final file = File(path!);
      return NativeDatabase(file, logStatements: kDebugMode);
    });
  }

  return NativeDatabase.memory(logStatements: kDebugMode);
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
