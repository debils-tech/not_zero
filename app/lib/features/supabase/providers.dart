import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero/features/supabase/managers/supabase_manager.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabaseManagerProvider = Provider<SupabaseManager>((ref) {
  return const SupabaseManager();
});

final supabaseClientProvider = Provider<SupabaseClient>((ref) {
  return Supabase.instance.client;
});

final supabaseUserProvider = Provider<String?>((ref) {
  return Supabase.instance.client.auth.currentUser?.id;
});
