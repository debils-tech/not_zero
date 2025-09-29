import 'package:not_zero/units/stats/models/global_stats_action.dart';
import 'package:nz_actions/nz_actions.dart';

class TasksActionsHandlerRepository
    implements ActionsHandler<GlobalStatsAction, GlobalStatsActionType> {
  @override
  bool canHandle(GlobalStatsAction action) =>
      action.type == GlobalStatsActionType.taskCompleted &&
      action is GlobalStatsActionTaskCompleted;

  @override
  Future<void> handleAction(GlobalStatsAction action) async {
    if (action is! GlobalStatsActionTaskCompleted) {
      return;
    }
  }
}
