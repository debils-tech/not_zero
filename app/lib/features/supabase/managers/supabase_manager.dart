import 'package:not_zero/features/env/env.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseManager {
  const SupabaseManager();

  Future<void> init() {
    return Supabase.initialize(
      url: Env.supabaseUrl,
      anonKey: Env.supabaseAnonKey,
      debug: true,
    );
  }

  Future<bool> login(String email, String password) async {
    try {
      final response = await Supabase.instance.client.auth.signInWithPassword(
        email: email,
        password: password,
      );

      return response.user != null;
    } catch (e) {
      return false;
    }
  }
}
