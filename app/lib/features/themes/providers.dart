import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero/features/themes/theme_data.dart';

final appDarkThemeProvider = Provider<ThemeData>((ref) {
  return createAppDarkTheme();
});

final appLightThemeProvider = Provider<ThemeData>((ref) {
  return createAppLightTheme();
});
