import 'package:flutter_dotenv/flutter_dotenv.dart';

class TypedEnvManager {
  TypedEnvManager(this._currentEnv);

  final DotEnv _currentEnv;

  /// Url for supabase instance
  String get supabaseUrl => _currentEnv.env['SUPABASE_URL'] ?? '';

  /// Anon key for accessing supabase
  String get supabaseAnonKey => _currentEnv.env['SUPABASE_ANON_KEY'] ?? '';
}
