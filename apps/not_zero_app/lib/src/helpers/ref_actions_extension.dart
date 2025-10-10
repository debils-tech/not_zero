import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero_app/src/features/actions_bus/di.dart';
import 'package:nz_actions_bus/nz_actions_bus.dart';

extension RefActionsExtension on Ref {
  /// Subscribes to the actions bus for a specific action type and automatically
  /// disposes the subscription when the provider is disposed.
  ///
  /// Example:
  /// ```dart
  /// ref.listenActions<TaskAction>(_handleTaskAction);
  /// ```
  void listenActions<T extends AppAction>(void Function(T) onAction) {
    final actionsBus = watch(actionsBusProvider);
    final subscription = actionsBus.getStream<T>().listen(onAction);
    onDispose(subscription.cancel);
  }
}
