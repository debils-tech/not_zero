import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'app_daily_check_in.freezed.dart';
part 'app_daily_check_in.g.dart';

@freezed
abstract class AppDailyCheckIn with _$AppDailyCheckIn {
  const factory AppDailyCheckIn({
    required String id,
    required DateTime checkInDate,
    @Default(1) int streakCount,
  }) = _AppDailyCheckIn;

  factory AppDailyCheckIn.create({
    required DateTime checkInDate,
    required int streakCount,
  }) => AppDailyCheckIn(
    id: const Uuid().v4(),
    checkInDate: checkInDate,
    streakCount: streakCount,
  );

  factory AppDailyCheckIn.fromJson(Map<String, dynamic> json) =>
      _$AppDailyCheckInFromJson(json);
}
