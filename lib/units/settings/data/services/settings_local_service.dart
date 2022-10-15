import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:not_zero/constants/database.dart';
import 'package:not_zero/db/provider.dart';
import 'package:not_zero/units/settings/domain/models/theme_state.dart';

abstract class SettingsLocalService {
  ThemeState? getThemeState();

  Future<void> setThemeState(ThemeState state);
}

@LazySingleton(as: SettingsLocalService)
class SettingsLocalServiceImpl implements SettingsLocalService {
  SettingsLocalServiceImpl(StorageProvider storage) {
    _db = storage.settings;
  }

  late final Box<String> _db;

  @override
  ThemeState? getThemeState() {
    final stringValue = _db.get(SettingsKeys.themeState);

    if (stringValue != null) {
      return ThemeState.values.byName(stringValue);
    }
    return null;
  }

  @override
  Future<void> setThemeState(ThemeState state) {
    return _db.put(SettingsKeys.themeState, state.name);
  }
}
