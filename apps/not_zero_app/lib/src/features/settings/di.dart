import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero_app/src/features/settings/models/app_theme_settings.dart';
import 'package:not_zero_app/src/features/settings/notifiers/theme_settings_notifier.dart';
import 'package:not_zero_app/src/features/settings/repositories/settings_repository.dart';
import 'package:not_zero_app/src/features/settings/services/settings_local_service.dart';
import 'package:not_zero_app/src/features/storage/di.dart';
import 'package:not_zero_app/src/helpers/app_info.dart';

final settingsLocalServiceProvider = Provider<SettingsLocalService>((ref) {
  return SettingsLocalService(
    ref.watch(settingsBoxProvider),
  );
});

final settingsRepositoryProvider = Provider<SettingsRepository>((ref) {
  return SettingsRepository(
    ref.watch(settingsLocalServiceProvider),
  );
});

final NotifierProvider<ThemeSettingsNotifier, AppThemeSettings>
themeSettingsNotifierProvider =
    NotifierProvider.autoDispose<ThemeSettingsNotifier, AppThemeSettings>(
      ThemeSettingsNotifier.new,
    );

final appInfoProvider = FutureProvider<AppInfo>((ref) async {
  return AppInfo.fromEnvironment();
});
