import 'package:freezed_annotation/freezed_annotation.dart';

part 'plans_filter_model.freezed.dart';
part 'plans_filter_model.g.dart';

@freezed
class PlansFilterModel with _$PlansFilterModel {
  const factory PlansFilterModel({
    required DateTime forDate,
  }) = _PlansFilterModel;

  factory PlansFilterModel.fromJson(Map<String, dynamic> json) =>
      _$PlansFilterModelFromJson(json);
}
