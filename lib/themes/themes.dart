import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:not_zero/themes/task_colors.dart';

final _lightThemeBase = FlexThemeData.light(
  scheme: FlexScheme.material,
  extensions: <ThemeExtension>[
    TaskColorsScheme.light,
  ],
);

final defaultLightTheme = _lightThemeBase.copyWith(
  useMaterial3: true,
  textTheme: _lightThemeBase.textTheme.copyWith(
    titleSmall: TextStyle(color: Colors.grey.shade500),
  ),
  checkboxTheme: _lightThemeBase.checkboxTheme.copyWith(
    fillColor: MaterialStateProperty.resolveWith(
      (states) => states.contains(MaterialState.selected)
          ? _lightThemeBase.primaryColorLight
          : null,
    ),
  ),
  radioTheme: _lightThemeBase.radioTheme.copyWith(
    fillColor: MaterialStateProperty.resolveWith(
      (states) => states.contains(MaterialState.selected)
          ? _lightThemeBase.primaryColorLight
          : null,
    ),
  ),
);

final _darkThemeBase = FlexThemeData.dark(
  scheme: FlexScheme.material,
  extensions: <ThemeExtension>[
    TaskColorsScheme.dark,
  ],
);

final defaultDarkTheme = _darkThemeBase.copyWith(
  useMaterial3: true,
  textTheme: _darkThemeBase.textTheme.copyWith(
    titleSmall: TextStyle(color: Colors.grey.shade700),
  ),
  checkboxTheme: _darkThemeBase.checkboxTheme.copyWith(
    fillColor: MaterialStateProperty.resolveWith(
      (states) => states.contains(MaterialState.selected)
          ? _darkThemeBase.primaryColor
          : null,
    ),
  ),
  radioTheme: _darkThemeBase.radioTheme.copyWith(
    fillColor: MaterialStateProperty.resolveWith(
      (states) => states.contains(MaterialState.selected)
          ? _darkThemeBase.primaryColor
          : null,
    ),
  ),
);
