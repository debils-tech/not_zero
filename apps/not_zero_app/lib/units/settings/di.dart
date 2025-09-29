import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero_app/helpers/app_info.dart';
import 'package:not_zero_app/units/settings/models/theme_state.dart';
import 'package:not_zero_app/units/settings/notifiers/theme_state_notifier.dart';
import 'package:not_zero_app/units/settings/repositories/settings_repository.dart';
import 'package:not_zero_app/units/settings/services/settings_local_service.dart';
import 'package:not_zero_app/units/storage/di.dart';

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

final NotifierProvider<ThemeStateNotifier, ThemeState>
themeStateNotifierProvider =
    NotifierProvider.autoDispose<ThemeStateNotifier, ThemeState>(
      ThemeStateNotifier.new,
    );

final appInfoProvider = FutureProvider<AppInfo>((ref) async {
  return AppInfo.fromEnvironment();
});
