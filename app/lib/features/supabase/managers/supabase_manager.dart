import 'package:logging/logging.dart';
import 'package:not_zero/features/env/env.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseManager {
  const SupabaseManager();

  static final _log = Logger('SupabaseManager');

  Future<void> init() async {
    try {
      await Supabase.initialize(
        url: Env.supabaseUrl,
        anonKey: Env.supabaseAnonKey,
        debug: true,
      );
    } catch (e, s) {
      _log
        ..warning('Error on initial supabase initialization', e, s)
        ..fine('Trying to initialize again');
      await Supabase.instance.dispose();
      await Supabase.initialize(
        url: Env.supabaseUrl,
        anonKey: Env.supabaseAnonKey,
        debug: true,
      );
    }
  }

  bool hasAccount() {
    final user = Supabase.instance.client.auth.currentUser;
    return user != null;
  }

  Future<bool> login(String email, String password) async {
    try {
      final response = await Supabase.instance.client.auth.signInWithPassword(
        email: email,
        password: password,
      );

      return response.user != null;
    } catch (e, s) {
      _log.warning('Error on login', e, s);
      return false;
    }
  }

  Future<bool> signUp(String email, String password) async {
    try {
      final response = await Supabase.instance.client.auth.signUp(
        email: email,
        password: password,
      );

      return response.user != null;
    } catch (e, s) {
      _log.warning('Error on sign up', e, s);
      return false;
    }
  }
}
