import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:not_zero/themes/charts_colors.dart';
import 'package:not_zero/themes/tags_colors.dart';
import 'package:not_zero/themes/tasks_colors.dart';

final _lightThemeBase = FlexThemeData.light(
  scheme: FlexScheme.material,
  useMaterial3: true,
  extensions: <ThemeExtension>[
    TasksColorScheme.light,
    ChartsColorScheme.light,
    TagsColorScheme.light,
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
  splashFactory: kIsWeb ? null : InkSparkle.splashFactory,
);

final _darkThemeBase = FlexThemeData.dark(
  scheme: FlexScheme.material,
  useMaterial3: true,
  extensions: <ThemeExtension>[
    TasksColorScheme.dark,
    ChartsColorScheme.dark,
    TagsColorScheme.dark,
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
  splashFactory: kIsWeb ? null : InkSparkle.splashFactory,
);
