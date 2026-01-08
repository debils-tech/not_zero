import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:nz_common/nz_common.dart';

class NotificationPermissionRepository implements BaseRepository {
  const NotificationPermissionRepository(this.notificationsPlugin);

  final FlutterLocalNotificationsPlugin notificationsPlugin;

  Future<bool> requestPermissions() async {
    if (Platform.isAndroid) {
      final androidPlugin = notificationsPlugin
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
      return granted;
    }

    if (Platform.isIOS) {
      final iosPlugin = notificationsPlugin
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
      final macosPlugin = notificationsPlugin
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

  Future<bool?> arePermissionsGranted() async {
    if (Platform.isAndroid) {
      final androidPlugin = notificationsPlugin
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
}
