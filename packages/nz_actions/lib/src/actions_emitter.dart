import 'package:nz_actions/src/action_mixin.dart';
import 'package:nz_common/nz_common.dart';
import 'package:rxdart/rxdart.dart';

mixin ActionsEmitter<T extends ActionMixin<E>, E extends Enum> on AsyncObject {
  final _actionsStream = ReplaySubject<T>();

  Stream<T> get actionsStream => _actionsStream.stream;

  void addAction(T action) {
    _actionsStream.add(action);
  }

  void disposeActions() {
    _actionsStream.close();
  }
}
