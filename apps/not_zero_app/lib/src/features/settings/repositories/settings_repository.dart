import 'package:logging/logging.dart';
import 'package:not_zero_app/src/features/settings/models/app_theme_settings.dart';
import 'package:not_zero_app/src/features/settings/models/theme_state.dart';
import 'package:not_zero_app/src/features/settings/services/settings_local_service.dart';

class SettingsRepository {
  const SettingsRepository(this._settingsLocalService);

  final SettingsLocalService _settingsLocalService;

  static final _log = Logger('SettingsRepository');

  AppThemeSettings loadThemeSettings() {
    _log.fine('Loading theme settings');
    return AppThemeSettings(
      themeState: _settingsLocalService.getThemeState() ?? ThemeState.system,
      useDynamicColors: _settingsLocalService.getUseDynamicColors() ?? true,
      harmonizeColors: _settingsLocalService.getHarmonizeColors() ?? true,
    );
  }

  Future<void> saveThemeSettings(AppThemeSettings settings) async {
    _log.fine('Saving theme settings: $settings');
    await _settingsLocalService.setThemeState(settings.themeState);
    await _settingsLocalService.setUseDynamicColors(settings.useDynamicColors);
    await _settingsLocalService.setHarmonizeColors(settings.harmonizeColors);
  }
}
