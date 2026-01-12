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

import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:nz_common/nz_common.dart';

class NotificationPermissionRepository implements BaseRepository {
  const NotificationPermissionRepository(this._notificationsPlugin);

  final FlutterLocalNotificationsPlugin _notificationsPlugin;

  Future<bool> requestPermissions() async {
    final permissionGranted = await isNotificationPermissionGranted();
    final exactAlarms = await canUseExactAlarm();
    if ((permissionGranted ?? false) && exactAlarms) {
      return true;
    }

    if (Platform.isAndroid) {
      final androidPlugin = _notificationsPlugin
          .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin
          >();

      if (androidPlugin == null) {
        return false;
      }

      // For Android 13+ (API 33+), this will show the permission dialog
      // For Android 12 and below, this returns true immediately
      final granted =
          await androidPlugin.requestNotificationsPermission() ?? false;

      // SCHEDULE_EXACT_ALARM or USE_EXACT_ALARM permission is required
      // for exact time notification scheduling
      if (!exactAlarms) {
        await androidPlugin.requestExactAlarmsPermission();
      }

      return granted;
    }

    if (Platform.isIOS) {
      final iosPlugin = _notificationsPlugin
          .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin
          >();

      if (iosPlugin == null) {
        return false;
      }

      // Request permissions with all options enabled
      final granted = await iosPlugin.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );

      return granted ?? false;
    }
    if (Platform.isMacOS) {
      final macosPlugin = _notificationsPlugin
          .resolvePlatformSpecificImplementation<
            MacOSFlutterLocalNotificationsPlugin
          >();

      if (macosPlugin == null) {
        return false;
      }

      // Request permissions with all options enabled
      final granted = await macosPlugin.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );

      return granted ?? false;
    }

    // For other platforms (Linux, Windows), no permission is needed
    return true;
  }

  Future<bool?> isNotificationPermissionGranted() async {
    if (Platform.isAndroid) {
      final androidPlugin = _notificationsPlugin
          .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin
          >();

      if (androidPlugin == null) {
        return null;
      }

      // Check if notification permission is granted
      return androidPlugin.areNotificationsEnabled();
    }

    if (Platform.isIOS || Platform.isMacOS) {
      // Check current notification settings
      // For iOS and macOS, we can't reliably check permission status without requesting
      // So we return null to indicate unknown status
      return null;
    }

    // For other platforms, assume permissions are always granted
    return true;
  }

  Future<bool> canUseExactAlarm() async {
    if (Platform.isAndroid) {
      final androidPlugin = _notificationsPlugin
          .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin
          >();

      if (androidPlugin == null) {
        return false;
      }

      return await androidPlugin.canScheduleExactNotifications() ?? false;
    }

    return true;
  }
}
