import 'dart:async';

import 'package:meta/meta.dart';
import 'package:nz_common/nz_common.dart';
import 'package:rxdart/rxdart.dart';

@immutable
abstract class AppAction {
  const AppAction();
}

class ActionsBus implements LivingObject {
  final _actionsInternalController = PublishSubject<AppAction>();

  Stream<T> getStream<T extends AppAction>() {
    return _actionsInternalController.stream.whereType<T>();
  }

  void emit(AppAction action) {
    _actionsInternalController.add(action);
  }

  @override
  void init() {}

  @override
  void dispose() {
    unawaited(_actionsInternalController.close());
  }
}
