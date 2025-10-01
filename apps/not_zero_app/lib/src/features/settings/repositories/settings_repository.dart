import 'package:logging/logging.dart';
import 'package:not_zero_app/src/features/settings/models/theme_state.dart';
import 'package:not_zero_app/src/features/settings/services/settings_local_service.dart';

class SettingsRepository {
  SettingsRepository(this._settingsLocalService);

  final SettingsLocalService _settingsLocalService;

  final log = Logger('SettingsRepository');

  ThemeState loadThemeState() {
    return _settingsLocalService.getThemeState() ?? ThemeState.system;
  }

  Future<void> saveThemeState(ThemeState state) {
    return _settingsLocalService.setThemeState(state);
  }
}
