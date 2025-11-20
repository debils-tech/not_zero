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

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationManager {
  NavigationManager();

  final _globalKey = GlobalKey<NavigatorState>();

  Key get key => _globalKey;

  BuildContext? get _context => _globalKey.currentContext;

  GoRouter get _router => GoRouter.of(_context!);

  void go(String path, {Object? extra}) => _router.go(path, extra: extra);

  Future<void> push(String path, {Object? extra}) =>
      _router.push(path, extra: extra);

  void pop() => _router.pop();

  void popToRoot() => _router.go('/');

  void replace(String path, {Object? extra}) =>
      _router.replace<void>(path, extra: extra);
}
