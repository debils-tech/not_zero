import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:not_zero/helpers/theming.dart';

final _lightThemeBase = FlexThemeData.light(
  scheme: FlexScheme.material,
  extensions: <ThemeExtension>[
    TaskColors(
      notImportantColor: Colors.blueGrey.shade400,
      normalColor: Colors.amber,
      importantColor: Colors.red,
    ),
  ],
);

final defaultLightTheme = _lightThemeBase.copyWith(
  useMaterial3: true,
  textTheme: _lightThemeBase.textTheme.copyWith(
    subtitle2: TextStyle(color: Colors.grey.shade500),
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
    TaskColors(
      notImportantColor: Colors.grey[350]!,
      normalColor: Colors.amberAccent,
      importantColor: Colors.redAccent,
    ),
  ],
);

final defaultDarkTheme = _darkThemeBase.copyWith(
  useMaterial3: true,
  textTheme: _darkThemeBase.textTheme.copyWith(
    subtitle2: TextStyle(color: Colors.grey.shade700),
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
