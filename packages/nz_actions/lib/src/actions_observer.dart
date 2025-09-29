import 'dart:async';

import 'package:meta/meta.dart';
import 'package:nz_actions/src/action_mixin.dart';
import 'package:nz_actions/src/actions_emitter.dart';
import 'package:nz_actions/src/actions_handler.dart';
import 'package:nz_common/nz_common.dart';
import 'package:rxdart/rxdart.dart';

class ActionsObserver<T extends ActionMixin<E>, E extends Enum>
    implements AsyncObject {
  ActionsObserver({required this.emitters, required this.handlers});

  @protected
  final List<ActionsEmitter<T, E>> emitters;

  @protected
  final List<ActionsHandler<T, E>> handlers;

  StreamSubscription<T>? _subscription;

  @override
  void init() {
    _subscription = MergeStream(
      emitters.map((e) => e.actionsStream),
    ).listen(_onAction);
  }

  @override
  void dispose() {
    _subscription?.cancel();
  }

  @protected
  Future<void> _onAction(T action) async {
    var handled = false;

    for (final handler in handlers) {
      if (handler.canHandle(action)) {
        await handler.handleAction(action);
        handled = true;
      }
    }

    if (!handled) {
      throw Exception('Action $action with type ${action.type} '
          'cant be handled by any handler');
    }
  }
}
