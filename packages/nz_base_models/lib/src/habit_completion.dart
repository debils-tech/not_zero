import 'package:freezed_annotation/freezed_annotation.dart';

part 'habit_completion.freezed.dart';
part 'habit_completion.g.dart';

@freezed
abstract class HabitCompletion with _$HabitCompletion {
  const factory HabitCompletion({
    required String id,
    required String habitId,
    required HabitCompletionType type,
    required DateTime completedDate,
  }) = _HabitCompletion;

  factory HabitCompletion.fromJson(Map<String, dynamic> json) =>
      _$HabitCompletionFromJson(json);
}

enum HabitCompletionType { completed, skipped }
