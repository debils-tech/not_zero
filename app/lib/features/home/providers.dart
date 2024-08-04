import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero/features/configs/providers.dart';
import 'package:not_zero/features/env/providers.dart';
import 'package:not_zero/features/home/managers/auth_manager.dart';
import 'package:not_zero/features/supabase/providers.dart';

final authManagerProvider = Provider<AuthManager>((ref) {
  return AuthManager(
    ref.watch(supabaseManagerProvider),
  );
});

final initProgressProvider = FutureProvider<bool>((ref) async {
  await ref.watch(envManagerProvider).loadEnv();

  final authManager = ref.watch(authManagerProvider);
  final success = await authManager.init();
  if (!success) return false;

  final configsManager = ref.watch(configsManagerProvider);
  await configsManager.init();

  return true;
});
