import 'package:flutter_test/flutter_test.dart';
import 'package:not_zero/get_it.dart';
import 'package:not_zero/helpers/app_info.dart';
import 'package:universal_io/io.dart';

import '../global_init.dart';

void main() {
  globalInit();

  test('Test app info values', () async {
    // AppInfo has async factory, so we should wait until it loads data.
    await getIt.allReady();

    final appInfo = getIt<AppInfo>();

    expect(
      appInfo,
      AppInfo(
        name: 'Not Zero',
        platform: Platform.operatingSystem,
        version: '0.0.0',
        buildNumber: 0,
      ),
    );
  });
}
