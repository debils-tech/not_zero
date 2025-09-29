import 'package:meta/meta.dart';
import 'package:nz_actions/src/action_mixin.dart';
import 'package:nz_common/nz_common.dart';
import 'package:rxdart/rxdart.dart';

abstract class ActionsEmitter<T extends ActionMixin<E>, E extends Enum>
    implements AsyncObject {
  final _actionsStream = ReplaySubject<T>();

  Stream<T> get actionsStream => _actionsStream.stream;

  @mustCallSuper
  @override
  void dispose() {
    _actionsStream.close();
  }

  void addAction(T action) {
    _actionsStream.add(action);
  }
}
