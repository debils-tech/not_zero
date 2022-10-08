import 'package:injectable/injectable.dart';
import 'package:not_zero/units/settings/data/services/settings_local_service.dart';
import 'package:not_zero/units/settings/domain/models/theme_state.dart';
import 'package:not_zero/units/settings/domain/repositories/settings_repository.dart';

@LazySingleton(as: SettingsRepository)
class SettingsRepositoryImpl implements SettingsRepository {
  SettingsRepositoryImpl(this._localService);

  final SettingsLocalService _localService;

  @override
  Future<ThemeState> loadThemeState() async {
    return await _localService.getThemeState() ?? ThemeState.system;
  }

  @override
  Future<void> saveThemeState(ThemeState state) {
    return _localService.setThemeState(state);
  }
}
