import 'package:nz_actions/src/action_mixin.dart';

abstract interface class ActionsHandler<T extends ActionMixin<E>,
    E extends Enum> {
  bool canHandle(T action);

  Future<void> handleAction(T action);
}
