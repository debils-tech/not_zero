import 'package:logging/logging.dart';
import 'package:not_zero/features/env/managers/typed_env_manager.dart';
import 'package:not_zero/utils/async_lifecycle_object.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseManager implements AsyncLifecycleObject {
  const SupabaseManager(this._env);

  final TypedEnvManager _env;

  static final _log = Logger('SupabaseManager');

  @override
  Future<void> init() async {
    _log.fine('Initializing supabase with envs: '
        'URL= ${_env.supabaseUrl}, '
        'KEY= ${_env.supabaseAnonKey}');

    try {
      await Supabase.initialize(
        url: _env.supabaseUrl,
        anonKey: _env.supabaseAnonKey,
        debug: true,
      );
    } catch (e, s) {
      _log
        ..warning('Error on initial supabase initialization', e, s)
        ..fine('Trying to initialize again');
      await Supabase.instance.dispose();
      await Supabase.initialize(
        url: _env.supabaseUrl,
        anonKey: _env.supabaseAnonKey,
        debug: true,
      );
      _log.info('Should have been initialized after second try');
    }
  }

  @override
  Future<void> dispose() {
    _log.info('Disposing supabase manager');
    return Supabase.instance.dispose();
  }

  bool hasAccount() {
    final user = Supabase.instance.client.auth.currentUser;
    return user != null;
  }

  Future<bool> login(String email, String password) async {
    _log.fine('Login to supabase with email= $email');
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
    _log.fine('Sign up to supabase with email= $email');
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

  Future<bool> logOut() async {
    _log.fine('Log out from supabase');
    try {
      await Supabase.instance.client.auth.signOut();
      await Supabase.instance.dispose();
      return true;
    } catch (e, s) {
      _log.severe('Error on log out', e, s);
      return false;
    }
  }
}
