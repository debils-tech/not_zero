// Not Zero, cross-platform wellbeing application.
// Copyright (C) 2025 Nagorny Vladislav
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

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
