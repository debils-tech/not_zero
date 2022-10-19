import 'package:flutter_test/flutter_test.dart';
import 'package:not_zero/db/provider.dart';
import 'package:not_zero/get_it.dart';

import 'init_paths.dart';

void globalInit() {
  setUpAll(() async {
    initPaths();
    await StorageProvider.initHiveBoxes();
    configureDependencies();
  });

  tearDownAll(() => getIt<StorageProvider>().deleteFromDisk());
}
