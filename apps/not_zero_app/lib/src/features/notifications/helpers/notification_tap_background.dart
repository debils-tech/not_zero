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

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:not_zero_app/src/features/notifications/models/app_notification_payload.dart';

/// Top-level function to handle background actions.
///
/// Shouldn't access any app state here.
@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) {
  debugPrint(
    '[notificationTapBackground] '
    'Notification #${notificationResponse.id} background tap handling '
    'Action tapped: ${notificationResponse.actionId} '
    'Payload: ${notificationResponse.payload}',
  );

  final actionId = notificationResponse.actionId;
  final notificationPayload = notificationResponse.payload;
  if (actionId == null || notificationPayload == null) return;

  try {
    final json = jsonDecode(notificationPayload);
    final payload = AppNotificationPayload.fromJson(
      Map<String, dynamic>.from(json as Map),
    );

    switch ((actionId, payload)) {
      // TODO(uSlashVlad): Handle payload.
      case _:
        debugPrint(
          '[notificationTapBackground] Unimplemented payload: $payload',
        );
    }
  } on Object catch (e, s) {
    debugPrint(
      '[notificationTapBackground] Error while parsing payload: $e\n$s',
    );
    debugPrint('[notificationTapBackground] Payload: $notificationPayload');
  }
}
