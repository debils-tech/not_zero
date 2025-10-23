import 'package:logging/logging.dart';
import 'package:not_zero_app/src/features/settings/models/theme_state.dart';
import 'package:nz_boxes/nz_boxes.dart';
import 'package:nz_common/nz_common.dart';

class SettingsLocalService implements BaseService {
  const SettingsLocalService(this._settingsBox);

  final NotZeroSimpleBox _settingsBox;

  static final log = Logger('SettingsLocalService');

  static const _themeStateKey = 'themeState';
  static const _useDynamicColorsKey = 'useDynamicColors';
  static const _harmonizeColorsKey = 'harmonizeColors';

  ThemeState? getThemeState() {
    final stringValue = _settingsBox.getString(_themeStateKey);

    if (stringValue != null) {
      return ThemeState.values.byName(stringValue);
    }
    return null;
  }

  Future<void> setThemeState(ThemeState state) {
    return _settingsBox.putString(_themeStateKey, state.name);
  }

  bool? getUseDynamicColors() {
    return _settingsBox.getBool(_useDynamicColorsKey);
  }

  Future<void> setUseDynamicColors(bool value) {
    return _settingsBox.putBool(_useDynamicColorsKey, value);
  }

  bool? getHarmonizeColors() {
    return _settingsBox.getBool(_harmonizeColorsKey);
  }

  Future<void> setHarmonizeColors(bool value) {
    return _settingsBox.putBool(_harmonizeColorsKey, value);
  }
}
