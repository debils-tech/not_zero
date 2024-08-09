import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:not_zero/constants/database.dart';
import 'package:not_zero/db/provider.dart';
import 'package:not_zero/units/settings/domain/models/theme_state.dart';

@lazySingleton
class SettingsLocalService {
  SettingsLocalService(StorageProvider storage) {
    _settingsBox = storage.settings;
  }

  late final Box<String> _settingsBox;

  final log = Logger('SettingsLocalService');

  ThemeState? getThemeState() {
    final stringValue = _settingsBox.get(SettingsKeys.themeState);

    if (stringValue != null) {
      return ThemeState.values.byName(stringValue);
    }
    return null;
  }

  Future<void> setThemeState(ThemeState state) {
    return _settingsBox.put(SettingsKeys.themeState, state.name);
  }
}
