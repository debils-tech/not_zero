import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero/constants/database.dart';
import 'package:nz_boxes/nz_boxes.dart';
import 'package:nz_common/nz_common.dart';
import 'package:nz_drift/nz_drift.dart';

final databaseProvider = Provider<NotZeroDatabase>((ref) {
  if (isPlatformTest) {
    // It will be generally better to run test on faster database.
    //
    // Also it helps to avoid problems with complex things like drift isolates.
    return NotZeroDatabase.memory();
  }

  return NotZeroDatabase();
});

final settingsBoxProvider = Provider<NotZeroSimpleBox>((ref) {
  return NotZeroSimpleBox(BoxNames.settings);
});
