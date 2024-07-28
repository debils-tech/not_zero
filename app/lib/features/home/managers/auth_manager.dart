import 'package:not_zero/features/supabase/managers/supabase_manager.dart';

class AuthManager {
  const AuthManager(this._supabaseManager);

  final SupabaseManager _supabaseManager;

  Future<bool> init() async {
    await _supabaseManager.init();

    final hasUser = _supabaseManager.hasAccount();
    return hasUser;
  }

  Future<bool> loginByPassword({
    required String email,
    required String password,
  }) async {
    return _supabaseManager.login(email, password);
  }

  Future<bool> signUpByPassword({
    required String email,
    required String password,
  }) async {
    return _supabaseManager.signUp(email, password);
  }
}
