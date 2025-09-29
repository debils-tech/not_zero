import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nz_actions/nz_actions.dart';
import 'package:nz_tasks_models/nz_tasks_models.dart';

part 'global_stats_action.freezed.dart';

@freezed
abstract class GlobalStatsAction
    with _$GlobalStatsAction, ActionMixin<GlobalStatsActionType> {
  const factory GlobalStatsAction.taskCompleted({
    required Task task,
    @Default(GlobalStatsActionType.taskCompleted) GlobalStatsActionType type,
  }) = GlobalStatsActionTaskCompleted;

  const factory GlobalStatsAction.appLogin({
    required DateTime loginTime,
    @Default(GlobalStatsActionType.appLogin) GlobalStatsActionType type,
  }) = GlobalStatsActionAppLogin;
}

enum GlobalStatsActionType {
  taskCompleted,
  appLogin,
}
