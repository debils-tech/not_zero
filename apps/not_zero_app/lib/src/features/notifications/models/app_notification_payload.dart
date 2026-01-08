import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_notification_payload.freezed.dart';
part 'app_notification_payload.g.dart';

@freezed
sealed class AppNotificationPayload with _$AppNotificationPayload {
  const factory AppNotificationPayload.loginReminder() =
      AppNotificationPayloadLoginReminder;

  const factory AppNotificationPayload.taskReminder({
    required String taskId,
    DateTime? forDateTime,
  }) = AppNotificationPayloadTaskReminder;

  const factory AppNotificationPayload.habitReminder({
    required String habitId,
    DateTime? forDateTime,
  }) = AppNotificationPayloadHabitReminder;

  factory AppNotificationPayload.fromJson(Map<String, dynamic> json) =>
      _$AppNotificationPayloadFromJson(json);
}
