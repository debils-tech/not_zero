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
