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
