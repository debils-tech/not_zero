import 'package:logging/logging.dart';
import 'package:not_zero_app/src/features/settings/models/theme_state.dart';
import 'package:nz_boxes/nz_boxes.dart';

class SettingsLocalService {
  const SettingsLocalService(this._settingsBox);

  final NotZeroSimpleBox _settingsBox;

  static final log = Logger('SettingsLocalService');

  static const _themeStateKey = 'themeState';

  ThemeState? getThemeState() {
    final stringValue = _settingsBox.value(_themeStateKey);

    if (stringValue != null) {
      return ThemeState.values.byName(stringValue);
    }
    return null;
  }

  Future<void> setThemeState(ThemeState state) {
    return _settingsBox.put(_themeStateKey, state.name);
  }
}
