import 'dart:convert';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:not_zero_app/src/features/notifications/models/app_notification_payload.dart';
import 'package:not_zero_app/src/features/translations/translations.g.dart';
import 'package:nz_common/nz_common.dart';
import 'package:timezone/timezone.dart';

class NotificationsShowRepository implements BaseRepository {
  const NotificationsShowRepository(this.notificationPlugin);

  final FlutterLocalNotificationsPlugin notificationPlugin;

  Future<void> scheduleReminder({
    required String id,
    required String text,
    required DateTime scheduleDateTime,
    AppNotificationPayload? payload,
    String idGroup = 'reminder',
  }) async {
    final intId = _generateIntegerId(id, modifier: idGroup);
    final notificationChannel = _remindersChannel;

    await notificationPlugin.cancel(intId);

    await notificationPlugin.zonedSchedule(
      intId,
      text,
      null,
      scheduleDateTime.toTimezoned(),
      NotificationDetails(
        android: AndroidNotificationDetails(
          notificationChannel.id,
          notificationChannel.name,
        ),
      ),
      // TODO(uSlashVlad): Should use exact or inexact here?
      androidScheduleMode: AndroidScheduleMode.exact,
      payload: payload != null ? jsonEncode(payload.toJson()) : null,
    );
  }

  static var _testId = 1337;

  Future<void> showTestReminder() {
    _testId *= 2;
    final notificationChannel = _remindersChannel;
    return notificationPlugin.show(
      _testId,
      'Test reminder #$_testId',
      'Test body',
      NotificationDetails(
        android: AndroidNotificationDetails(
          notificationChannel.id,
          notificationChannel.name,
        ),
      ),
    );
  }

  _NotificationChannel get _remindersChannel => (
    id: 'notify_reminders',
    name: t.common.notifications.channels.reminders.name,
  );

  /// Not secure hashing for IDs to get seamingly unique integer IDs for string
  static int _generateIntegerId(String id, {String modifier = ''}) {
    // Combine the UUID with the modifier (if provided)
    final input = modifier.isNotEmpty ? '$modifier:$id' : id;

    // Use a stable hashing algorithm
    // We want to fit into a signed 32-bit integer (-2^31 to 2^31 - 1).
    final hash = input.codeUnits.fold(
      0,
      (hash, charCode) => (hash * 31 + charCode) & 0xFFFFFFFF,
    );

    // Android notification IDs are 32-bit signed integers.
    // We ensure the result is positive and fits the range by masking
    // the sign bit (forcing it to 0-2147483647).
    return hash & 0x7FFFFFFF;
  }
}

typedef _NotificationChannel = ({
  String id,
  String name,
});

extension on DateTime {
  TZDateTime toTimezoned() => TZDateTime.local(
    year,
    month,
    day,
    hour,
    minute,
    second,
    millisecond,
    microsecond,
  );
}
