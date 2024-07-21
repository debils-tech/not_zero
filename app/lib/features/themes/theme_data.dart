import 'package:flutter/material.dart';

ThemeData createAppDarkTheme() {
  final base = ThemeData.dark();

  return base.copyWith(
    checkboxTheme: base.checkboxTheme.copyWith(
      shape: const CircleBorder(),
    ),
  );
}

ThemeData createAppLightTheme() => createAppDarkTheme();
