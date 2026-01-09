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
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero_app/src/features/notifications/repositories/notification_permission_repository.dart';
import 'package:not_zero_app/src/features/notifications/repositories/notifications_show_repository.dart';

final notificationPluginProvider = Provider(
  (ref) => FlutterLocalNotificationsPlugin(),
);

final notificationPermissionRepositoryProvider = Provider(
  (ref) => NotificationPermissionRepository(
    ref.watch(notificationPluginProvider),
  ),
);

final notificationsShowRepositoryProvider = Provider(
  (ref) => NotificationsShowRepository(
    ref.watch(notificationPermissionRepositoryProvider),
    ref.watch(notificationPluginProvider),
  ),
);
