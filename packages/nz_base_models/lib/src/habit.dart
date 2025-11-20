import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nz_base_models/src/habit_completion.dart';
import 'package:nz_base_models/src/habit_regularity.dart';
import 'package:nz_base_models/src/tag.dart';
import 'package:nz_base_models/src/task_importance.dart';
import 'package:uuid/uuid.dart';

part 'habit.freezed.dart';
part 'habit.g.dart';

@freezed
abstract class Habit with _$Habit {
  const factory Habit({
    required String id,
    required String title,
    required DateTime createdAt,
    @Default('') String description,
    @Default(TaskImportance.normal) TaskImportance importance,
    DateTime? modifiedAt,
    @JsonKey(toJson: Habit._completionsToJson)
    @Default([])
    List<HabitCompletion> completions,
    @Default(HabitRegularity.daily()) HabitRegularity regularity,
    @JsonKey(toJson: ItemTag.tagsToIds) @Default([]) List<ItemTag> tags,
  }) = _Habit;

  const Habit._();

  factory Habit.fromJson(Map<String, dynamic> json) => _$HabitFromJson(json);

  factory Habit.create({
    required String title,
    String? description,
    TaskImportance? importance,
    HabitRegularity? regularity,
  }) => Habit(
    id: const Uuid().v4(),
    title: title,
    description: description ?? '',
    createdAt: DateTime.now(),
    importance: importance ?? .normal,
    regularity: regularity ?? const HabitRegularity.daily(),
  );

  Habit edit({
    String? title,
    String? description,
    TaskImportance? importance,
    HabitRegularity? regularity,
  }) => copyWith(
    title: title ?? this.title,
    description: description ?? this.description,
    importance: importance ?? this.importance,
    modifiedAt: DateTime.now(),
    regularity: regularity ?? this.regularity,
  );

  static List<String> _completionsToJson(List<HabitCompletion> field) =>
      field.map((e) => e.id).toList();
}
