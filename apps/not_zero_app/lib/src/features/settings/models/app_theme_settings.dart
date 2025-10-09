import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:not_zero_app/src/features/settings/models/theme_state.dart';

part 'app_theme_settings.freezed.dart';

@freezed
abstract class AppThemeSettings with _$AppThemeSettings {
  const factory AppThemeSettings({
    @Default(ThemeState.system) ThemeState themeState,
    @Default(true) bool useDynamicColors,
    @Default(true) bool harmonizeColors,
  }) = _AppThemeSettings;
}
