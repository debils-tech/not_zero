import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nz_base_models/src/habit_completion.dart';
import 'package:nz_base_models/src/habit_regularity.dart';
import 'package:nz_base_models/src/task_importance.dart';
import 'package:uuid/uuid.dart';

part 'habit.freezed.dart';
part 'habit.g.dart';

@freezed
abstract class Habit with _$Habit {
  const factory Habit({
    required String id,
    required String title,
    @Default('') String description,
    @Default(TaskImportance.normal) TaskImportance importance,
    required DateTime createdAt,
    DateTime? modifiedAt,
    @JsonKey(toJson: Habit._completionsToJson)
    @Default([])
    List<HabitCompletion> completions,
    @Default(HabitRegularity.daily()) HabitRegularity regularity,
  }) = _Habit;

  const Habit._();

  factory Habit.fromJson(Map<String, dynamic> json) => _$HabitFromJson(json);

  factory Habit.create({
    required String title,
    String? description,
    TaskImportance? importance,
  }) => Habit(
    id: const Uuid().v4(),
    title: title,
    description: description ?? '',
    createdAt: DateTime.now(),
    importance: importance ?? TaskImportance.normal,
  );

  Habit edit({
    String? title,
    String? description,
    TaskImportance? importance,
  }) => copyWith(
    title: title ?? this.title,
    description: description ?? this.description,
    importance: importance ?? this.importance,
    modifiedAt: DateTime.now(),
  );

  static List<String> _completionsToJson(List<HabitCompletion> field) =>
      field.map((e) => e.id).toList();
}
