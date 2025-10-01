import 'package:flutter/material.dart';

abstract class GlobalNavigation {
  static final key = GlobalKey<NavigatorState>();

  static BuildContext get context => key.currentContext!;

  static NavigatorState? get navigator {
    final currentContext = key.currentContext;
    if (currentContext == null) return null;

    return Navigator.maybeOf(currentContext);
  }
}
