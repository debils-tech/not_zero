import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_plan_model.freezed.dart';
part 'daily_plan_model.g.dart';

@freezed
class DailyPlanModel with _$DailyPlanModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory DailyPlanModel({
    required String id,
    required DateTime createdAt,
    required DateTime updatedAt,
    required DateTime forDate,
    required String title,
    @Default('') String description,
    DateTime? completedAt,
  }) = _DailyPlanModel;

  factory DailyPlanModel.fromJson(Map<String, dynamic> json) =>
      _$DailyPlanModelFromJson(json);
}

@freezed
class DailyPlanModelInsert with _$DailyPlanModelInsert {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory DailyPlanModelInsert({
    required String userId,
    required DateTime forDate,
    required String title,
    @Default('') String description,
    DateTime? completedAt,
  }) = _DailyPlanModelInsert;

  factory DailyPlanModelInsert.fromJson(Map<String, dynamic> json) =>
      _$DailyPlanModelInsertFromJson(json);
}
