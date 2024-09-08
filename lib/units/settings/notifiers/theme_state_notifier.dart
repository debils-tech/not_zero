import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero/units/settings/di.dart';
import 'package:not_zero/units/settings/models/theme_state.dart';

class ThemeStateNotifier extends AutoDisposeNotifier<ThemeState> {
  @override
  ThemeState build() {
    final settingsRepository = ref.read(settingsRepositoryProvider);
    return settingsRepository.loadThemeState();
  }

  void setTheme(ThemeState newState) {
    state = newState;
    final settingsRepository = ref.read(settingsRepositoryProvider);
    settingsRepository.saveThemeState(newState);
  }
}
