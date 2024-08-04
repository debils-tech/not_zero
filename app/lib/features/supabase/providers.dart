import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero/features/env/providers.dart';
import 'package:not_zero/features/supabase/managers/supabase_manager.dart';
import 'package:not_zero/utils/async_lifecycle_object.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabaseManagerProvider = Provider<SupabaseManager>((ref) {
  return AsyncLifecycleObject.wrapProvider(
    ref,
    SupabaseManager(
      ref.watch(typedEnvProvider),
    ),
    callInit: false,
  );
});

final supabaseClientProvider = Provider<SupabaseClient>((ref) {
  return Supabase.instance.client;
});

final supabaseUserProvider = Provider<String?>((ref) {
  return Supabase.instance.client.auth.currentUser?.id;
});
