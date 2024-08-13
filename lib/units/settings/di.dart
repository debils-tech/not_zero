import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero/units/settings/bloc/theme_bloc.dart';
import 'package:not_zero/units/settings/repositories/settings_repository.dart';
import 'package:not_zero/units/settings/services/backup_local_service.dart';
import 'package:not_zero/units/settings/services/settings_local_service.dart';
import 'package:not_zero/units/storage/di.dart';
import 'package:not_zero/units/tags/di.dart';
import 'package:not_zero/units/tasks/di.dart';

final backupLocalServiceProvider = Provider<BackupLocalService>((ref) {
  return BackupLocalService(
    ref.watch(databaseProvider),
    ref.watch(settingsBoxProvider),
    ref.watch(tasksLocalServiceProvider),
    ref.watch(tagsLocalServiceProvider),
  );
});

final settingsLocalServiceProvider = Provider<SettingsLocalService>((ref) {
  return SettingsLocalService(
    ref.watch(settingsBoxProvider),
  );
});

final settingsRepositoryProvider = Provider<SettingsRepository>((ref) {
  return SettingsRepository(
    ref.watch(settingsLocalServiceProvider),
    ref.watch(backupLocalServiceProvider),
  );
});

// BLOC

final appThemeBlocProvider = Provider.autoDispose<AppThemeBloc>((ref) {
  return AppThemeBloc(
    ref.watch(settingsRepositoryProvider),
  );
});
