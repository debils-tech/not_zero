import 'package:flutter_test/flutter_test.dart';
import 'package:not_zero/db/provider.dart';
import 'package:not_zero/get_it.dart';

import 'fake_platform_interfaces.dart';

void globalInit() {
  initPaths();
  initPackageInfo();
  initFileHelper();

  setUpAll(() async {
    await StorageProvider.initHiveBoxes();
    configureDependencies();
  });

  tearDownAll(() => getIt<StorageProvider>().deleteFromDisk());
}
