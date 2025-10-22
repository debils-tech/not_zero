// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_completion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HabitCompletion _$HabitCompletionFromJson(Map<String, dynamic> json) =>
    _HabitCompletion(
      id: json['id'] as String,
      habitId: json['habitId'] as String,
      type: $enumDecode(_$HabitCompletionTypeEnumMap, json['type']),
      completedDate: DateTime.parse(json['completedDate'] as String),
    );

Map<String, dynamic> _$HabitCompletionToJson(_HabitCompletion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'habitId': instance.habitId,
      'type': _$HabitCompletionTypeEnumMap[instance.type]!,
      'completedDate': instance.completedDate.toIso8601String(),
    };

const _$HabitCompletionTypeEnumMap = {
  HabitCompletionType.completed: 'completed',
  HabitCompletionType.skipped: 'skipped',
};
