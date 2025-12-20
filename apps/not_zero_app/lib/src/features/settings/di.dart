// Not Zero, cross-platform wellbeing application.
// Copyright (C) 2025 Nagorny Vladislav
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero_app/src/features/settings/notifiers/theme_settings_notifier.dart';
import 'package:not_zero_app/src/features/settings/repositories/backup_repository.dart';
import 'package:not_zero_app/src/features/settings/repositories/settings_repository.dart';
import 'package:not_zero_app/src/features/settings/services/backup_local_service.dart';
import 'package:not_zero_app/src/features/settings/services/settings_local_service.dart';
import 'package:not_zero_app/src/features/storage/di.dart';
import 'package:not_zero_app/src/helpers/app_info.dart';

final settingsLocalServiceProvider = Provider<SettingsLocalService>((ref) {
  return SettingsLocalService(
    ref.watch(settingsBoxProvider),
  );
});

final backupLocalServiceProvider = Provider<BackupLocalService>((ref) {
  return BackupLocalService(
    ref.watch(databaseProvider),
    ref.watch(settingsBoxProvider),
  );
});

final settingsRepositoryProvider = Provider<SettingsRepository>((ref) {
  return SettingsRepository(
    ref.watch(settingsLocalServiceProvider),
  );
});

final backupRepositoryProvider = Provider<BackupRepository>((ref) {
  return BackupRepository(
    ref.watch(backupLocalServiceProvider),
  );
});

final themeSettingsNotifierProvider = NotifierProvider.autoDispose(
  ThemeSettingsNotifier.new,
);

final appInfoProvider = FutureProvider<AppInfo>((ref) async {
  return AppInfo.fromEnvironment();
});
