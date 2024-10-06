import 'dart:async';

import 'package:meta/meta.dart';
import 'package:nz_actions/src/action_mixin.dart';
import 'package:nz_actions/src/actions_emitter.dart';
import 'package:nz_common/nz_common.dart';
import 'package:rxdart/rxdart.dart';

abstract class ActionsObserver<T extends ActionMixin<E>, E extends Enum>
    implements AsyncObject {
  ActionsObserver(this.emitters);

  @protected
  final List<ActionsEmitter<T, E>> emitters;

  StreamSubscription<T>? _subscription;

  @override
  void init() {
    _subscription = MergeStream(
      emitters.map((e) => e.actionsStream),
    ).listen(onAction);
  }

  @override
  void dispose() {
    _subscription?.cancel();
  }

  @protected
  Future<void> onAction(T action);
}
