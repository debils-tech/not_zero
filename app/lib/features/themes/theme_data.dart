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
    inputDecorationTheme: base.inputDecorationTheme.copyWith(
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    ),
  );
}

ThemeData createAppLightTheme() => createAppDarkTheme();
