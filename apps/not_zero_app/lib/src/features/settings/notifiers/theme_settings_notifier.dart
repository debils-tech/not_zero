import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero_app/src/features/settings/di.dart';
import 'package:not_zero_app/src/features/settings/models/app_theme_settings.dart';
import 'package:not_zero_app/src/features/settings/models/theme_state.dart';

class ThemeSettingsNotifier extends Notifier<AppThemeSettings> {
  @override
  AppThemeSettings build() {
    final settingsRepository = ref.read(settingsRepositoryProvider);
    return settingsRepository.loadThemeSettings();
  }

  void setTheme(ThemeState newState) {
    state = state.copyWith(themeState: newState);
    final settingsRepository = ref.read(settingsRepositoryProvider);
    unawaited(settingsRepository.saveThemeSettings(state));
  }

  void setUseDynamicColors(bool newUseDynamicColors) {
    state = state.copyWith(useDynamicColors: newUseDynamicColors);
    final settingsRepository = ref.read(settingsRepositoryProvider);
    unawaited(settingsRepository.saveThemeSettings(state));
  }

  void setHarmonizeColors(bool newHarmonizeColors) {
    state = state.copyWith(harmonizeColors: newHarmonizeColors);
    final settingsRepository = ref.read(settingsRepositoryProvider);
    unawaited(settingsRepository.saveThemeSettings(state));
  }
}
