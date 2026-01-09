import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:logging/logging.dart';
import 'package:not_zero_app/src/features/notifications/models/app_notification_payload.dart';
import 'package:not_zero_app/src/features/notifications/repositories/notification_permission_repository.dart';
import 'package:not_zero_app/src/features/translations/translations.g.dart';
import 'package:nz_common/nz_common.dart';
import 'package:timezone/data/latest.dart' as tzd;
import 'package:timezone/timezone.dart';

class NotificationsShowRepository implements BaseRepository {
  const NotificationsShowRepository(
    this._permissionRepository,
    this._notificationPlugin,
  );

  final NotificationPermissionRepository _permissionRepository;
  final FlutterLocalNotificationsPlugin _notificationPlugin;

  static final _logger = Logger('NotificationsShowRepository');

  Future<bool> scheduleReminder({
    required String id,
    required String text,
    required DateTime scheduleDateTime,
    AppNotificationPayload? payload,
    String idGroup = 'reminder',
  }) async {
    if (Platform.isLinux || Platform.isWindows) {
      _logger.warning(
        "Notification sheduling doesn't work on Linux "
        "and Windows doesn't allow canceling without MSIX packaging. "
        'Skipping scheduling on this platforms.',
        null,
        StackTrace.current,
      );
      return false;
    }

    final permissionGranted = await _permissionRepository.requestPermissions();
    if (!permissionGranted) {
      _logger.warning(
        "Can't schedule notifications without notification permission",
      );
      return false;
    }

    final intId = _generateIntegerId(id, modifier: idGroup);
    final notificationChannel = _remindersChannel;

    await _updateLocalTimezone();
    try {
      await _notificationPlugin.cancel(intId);
    } on Object catch (e, s) {
      _logger.severe(
        'Error while canceling notification schedule '
        'with id "$idGroup:$id" ($intId) ',
        e,
        s,
      );
      return false;
    }

    try {
      final timezonedDateTime = scheduleDateTime.toTimezoned();
      final canUseExactAlarm = await _permissionRepository.canUseExactAlarm();

      await _notificationPlugin.zonedSchedule(
        intId,
        text,
        null,
        timezonedDateTime,
        NotificationDetails(
          android: AndroidNotificationDetails(
            notificationChannel.id,
            notificationChannel.name,
          ),
        ),
        androidScheduleMode: canUseExactAlarm
            ? AndroidScheduleMode.exactAllowWhileIdle
            : AndroidScheduleMode.inexactAllowWhileIdle,
        payload: payload != null ? jsonEncode(payload.toJson()) : null,
      );

      _logger.info(
        'Scheduled notification "$text" '
        'with id "$idGroup:$id" ($intId) '
        'to $timezonedDateTime '
        'exact alarm = $canUseExactAlarm',
      );
    } on Object catch (e, s) {
      _logger.severe(
        'Error while scheduling notification "$text" '
        'with id "$idGroup:$id" ($intId) '
        'to $scheduleDateTime',
        e,
        s,
      );
      return false;
    }

    return true;
  }

  Future<void> cancelReminder({
    required String id,
    String idGroup = 'reminder',
  }) async {
    final intId = _generateIntegerId(id, modifier: idGroup);
    await _notificationPlugin.cancel(intId);

    _logger.info('Canceled notification with id "$idGroup:$id" ($intId) ');
  }

  static var _testId = 1337;

  Future<void> showTestReminder() {
    _testId *= 2;
    final notificationChannel = _remindersChannel;
    return _notificationPlugin.show(
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

  // TODO(uSlashVlad): Maybe should move into some separate logic?
  static bool _isTimeZoneInit = false;

  static Future<void> _updateLocalTimezone() async {
    if (_isTimeZoneInit) return;

    tzd.initializeTimeZones();
    _isTimeZoneInit = true;
    final currentTimezone = await FlutterTimezone.getLocalTimezone();
    setLocalLocation(getLocation(currentTimezone.identifier));

    // Reset init after some time (in case user timezone is updated)
    unawaited(
      Future<void>.delayed(
        const Duration(minutes: 10),
        () => _isTimeZoneInit = false,
      ),
    );
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
