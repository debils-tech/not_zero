import 'dart:async';

import 'package:alchemist/alchemist.dart';
import 'package:nz_common/nz_common.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  return AlchemistConfig.runWithConfig(
    config: const AlchemistConfig(
      platformGoldensConfig: PlatformGoldensConfig(
        // It is constant that depends on the environment where test is built.
        // ignore: avoid_redundant_argument_values
        enabled: !isPlatformCi,
      ),
    ),
    run: testMain,
  );
}
