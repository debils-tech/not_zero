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
