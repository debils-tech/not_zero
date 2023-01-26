import 'package:flutter/material.dart';

abstract class GlobalNavigation {
  static final key = GlobalKey<NavigatorState>();

  static BuildContext get context => key.currentContext!;
}
