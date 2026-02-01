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

import 'dart:async';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:logging/logging.dart';
import 'package:not_zero_app/src/features/notifications/constants/notification_action_ids.dart';
import 'package:not_zero_app/src/features/notifications/helpers/notification_actions_registry.dart';
import 'package:not_zero_app/src/features/notifications/helpers/notification_tap_background.dart';
import 'package:not_zero_app/src/features/notifications/models/app_notification_payload.dart';
import 'package:not_zero_app/src/features/translations/translations.g.dart';
import 'package:not_zero_app/src/helpers/app_info.dart';
import 'package:nz_common/nz_common.dart';

class InitNotificationRepository implements BaseRepository {
  const InitNotificationRepository();

  static final _logger = Logger('InitNotificationRepository');

  Future<void> initAppNotifications() async {
    try {
      final appInfo = await AppInfo.fromEnvironment();

      const androidSettings = AndroidInitializationSettings(
        '@drawable/ic_notification',
      );
      final darwinSettings = DarwinInitializationSettings(
        notificationCategories: _buildDarwinCategories(),
      );
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
        onDidReceiveNotificationResponse: (response) {
          if (response.actionId == null ||
              response.actionId == NotificationActionIds.defaultAction) {
            _logger.info(
              'Notification #${response.id} foreground tap handling '
              'Payload: ${response.payload}',
            );

            final payload = response.payload;
            if (payload == null) return;

            unawaited(
              _handleDefaultAction(
                response.id,
                AppNotificationPayload.fromJsonString(payload),
              ),
            );
          } else {
            _logger.info(
              'Notifications with action id ${response.actionId} received. '
              'Handling as background tap.',
            );
            notificationTapBackground(response);
          }
        },
        onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
      );
    } on Object catch (e, s) {
      _logger.severe(
        'Error while initializing notifications! '
        "Local notifications probably wouldn't work",
        e,
        s,
      );
    }
  }

  Future<void> _handleDefaultAction(
    int? id,
    AppNotificationPayload payload,
  ) async {
    // TODO(uSlashVlad): Handle default action.
  }

  static List<DarwinNotificationCategory> _buildDarwinCategories() =>
      NotificationActionsRegistry.categories.map((c) {
        return DarwinNotificationCategory(
          c.id,
          actions: c.actions.map((a) {
            return DarwinNotificationAction.plain(
              a.id,
              a.label,
              options: {
                if (a.isDestructive) DarwinNotificationActionOption.destructive,
                if (a.requiresForeground)
                  DarwinNotificationActionOption.foreground,
              },
            );
          }).toList(),
        );
      }).toList();
}
