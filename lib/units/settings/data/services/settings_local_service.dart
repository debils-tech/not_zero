import 'package:injectable/injectable.dart';
import 'package:not_zero/constants/database.dart';
import 'package:not_zero/units/settings/domain/models/theme_state.dart';
import 'package:not_zero_storage/not_zero_database.dart';

abstract class SettingsLocalService {
  Future<ThemeState?> getThemeState();

  Future<void> setThemeState(ThemeState state);
}

@Singleton(as: SettingsLocalService)
class SettingsLocalServiceImpl implements SettingsLocalService {
  SettingsLocalServiceImpl(this._db);

  final DatabaseProvider _db;

  @override
  Future<ThemeState?> getThemeState() async {
    final stringValue =
        await _db.prefs.getLazy(SettingsKeys.themeState) as String?;

    if (stringValue != null) {
      return ThemeState.values.byName(stringValue);
    }
    return null;
  }

  @override
  Future<void> setThemeState(ThemeState state) async {
    await _db.prefs.set(SettingsKeys.themeState, state.name);
  }
}
