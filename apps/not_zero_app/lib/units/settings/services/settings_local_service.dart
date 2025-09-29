import 'package:logging/logging.dart';
import 'package:not_zero_app/constants/database.dart';
import 'package:not_zero_app/units/settings/models/theme_state.dart';
import 'package:nz_boxes/nz_boxes.dart';

class SettingsLocalService {
  SettingsLocalService(this._settingsBox);

  final NotZeroSimpleBox _settingsBox;

  final log = Logger('SettingsLocalService');

  ThemeState? getThemeState() {
    final stringValue = _settingsBox.value(SettingsKeys.themeState);

    if (stringValue != null) {
      return ThemeState.values.byName(stringValue);
    }
    return null;
  }

  Future<void> setThemeState(ThemeState state) {
    return _settingsBox.put(SettingsKeys.themeState, state.name);
  }
}
