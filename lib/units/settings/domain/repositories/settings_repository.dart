import 'package:not_zero/units/settings/domain/models/theme_state.dart';

abstract class SettingsRepository {
  ThemeState loadThemeState();

  Future<void> saveThemeState(ThemeState state);

  Future<bool> exportData();

  Future<bool> importData();
}
