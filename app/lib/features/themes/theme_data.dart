import 'package:flutter/material.dart';

ThemeData createAppDarkTheme() {
  final base = ThemeData.dark();

  return base.copyWith(
    checkboxTheme: base.checkboxTheme.copyWith(
      shape: const CircleBorder(),
    ),
    bottomSheetTheme: base.bottomSheetTheme.copyWith(
      showDragHandle: true,
    ),
  );
}

ThemeData createAppLightTheme() => createAppDarkTheme();
