import 'package:not_zero/units/settings/domain/models/theme_state.dart';

abstract class SettingsRepository {
  Future<ThemeState> loadThemeState();

  Future<void> saveThemeState(ThemeState state);
}
