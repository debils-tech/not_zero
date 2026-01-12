// Not Zero, cross-platform wellbeing application.
// Copyright (C) 2026 Nagorny Vladislav
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

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:logging/logging.dart';
import 'package:not_zero_app/src/features/translations/translations.g.dart';
import 'package:not_zero_app/src/helpers/app_info.dart';

abstract final class InitNotificationHelper {
  static Future<void> initAppNotifications() async {
    try {
      final appInfo = await AppInfo.fromEnvironment();

      const androidSettings = AndroidInitializationSettings(
        '@drawable/ic_notification',
      );
      const darwinSettings = DarwinInitializationSettings();
      final linuxSettings = LinuxInitializationSettings(
        defaultActionName: t.common.notifications.linuxDefaultAction,
      );
      final windowsSettings = WindowsInitializationSettings(
        appName: appInfo.name,
        appUserModelId: appInfo.packageName,
        guid: '9283b70d-6624-44fa-9075-3554fb56c4de',
      );

      await FlutterLocalNotificationsPlugin().initialize(
        InitializationSettings(
          android: androidSettings,
          iOS: darwinSettings,
          macOS: darwinSettings,
          linux: linuxSettings,
          windows: windowsSettings,
        ),
      );
    } on Object catch (e, s) {
      Logger(
        'InitNotificationHelper',
      ).severe(
        'Error while initializing notifications! '
        "Local notifications probably wouldn't work",
        e,
        s,
      );
    }
  }
}
