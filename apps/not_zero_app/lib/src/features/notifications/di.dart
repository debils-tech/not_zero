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
    ref.watch(notificationPluginProvider),
  ),
);
