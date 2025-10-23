import 'package:flutter/material.dart';

extension BuildContextQuickAccessExt on BuildContext {
  ThemeData get theme => Theme.of(this);
}
