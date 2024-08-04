import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero/features/env/managers/env_manager.dart';
import 'package:not_zero/features/env/managers/typed_env_manager.dart';

final envManagerProvider = Provider<EnvManager>((ref) {
  return EnvManager(
    ref.watch(_envDevProvider),
    ref.watch(_envProdProvider),
    ref.watch(useDevFlagStateProvider.notifier),
  );
});

final typedEnvProvider = Provider<TypedEnvManager>((ref) {
  // Shouldn't use dev env in production in any case
  final currentEnv =
      ref.watch(devModeProvider) && ref.watch(useDevFlagStateProvider)
          ? ref.watch(_envDevProvider)
          : ref.watch(_envProdProvider);

  return TypedEnvManager(currentEnv);
});

final devModeProvider = Provider<bool>((ref) {
  return kDebugMode || kProfileMode || const bool.fromEnvironment('DEV_MODE');
});

final useDevFlagStateProvider = StateProvider<bool>((ref) {
  return false;
});

final _envDevProvider = Provider<DotEnv>((ref) {
  return DotEnv();
});

final _envProdProvider = Provider<DotEnv>((ref) {
  return DotEnv();
});
