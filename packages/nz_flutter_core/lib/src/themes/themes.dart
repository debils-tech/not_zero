import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'extensions/charts_colors.dart';
import 'extensions/tags_colors.dart';
import 'extensions/tasks_colors.dart';

export 'extensions/charts_colors.dart';
export 'extensions/tags_colors.dart';
export 'extensions/tasks_colors.dart';

final _lightThemeBase = ThemeData.light(useMaterial3: true).copyWith(
  extensions: const <ThemeExtension>[
    TasksColorScheme(
      notImportantColor: Color(0xFF78909C),
      normalColor: Colors.amber,
      importantColor: Colors.red,
    ),
    ChartsColorScheme(
      chartBackgroundColor: Color(0xFFF3EDFD),
      gridColor: Colors.black12,
      borderColor: Colors.black26,
      tooltipBackgroundColor: Color(0xFF1B171E),
      weeklyStatsLine: Color(0xFFBB86FC),
      weeklyStatsBelowGradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0x80BB86FC),
          Color(0x60BB86FC),
        ],
      ),
    ),
    TagsColorScheme(
      gray: Color(0xFF636366),
      red: Color(0xFFFF3B30),
      orange: Color(0xFFFF9500),
      yellow: Color(0xFFFFCC00),
      green: Color(0xFF34C759),
      teal: Color(0xFF5AC8FA),
      blue: Color(0xFF007AFF),
      indigo: Color(0xFF5856D6),
      purple: Color(0xFFAF52DE),
      pink: Color(0xFFFF2D55),
    ),
  ],
);

final defaultLightTheme = _lightThemeBase.copyWith(
  splashFactory: kIsWeb ? null : InkSparkle.splashFactory,
  inputDecorationTheme: _lightThemeBase.inputDecorationTheme.copyWith(
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
  ),
);

final _darkThemeBase = ThemeData.dark(useMaterial3: true).copyWith(
  extensions: const <ThemeExtension>[
    TasksColorScheme(
      notImportantColor: Color(0xFFD6D6D6),
      normalColor: Colors.amberAccent,
      importantColor: Colors.redAccent,
    ),
    ChartsColorScheme(
      chartBackgroundColor: Color(0xFF251E2C),
      gridColor: Colors.white10,
      borderColor: Colors.white24,
      tooltipBackgroundColor: Color(0xFF1B171E),
      weeklyStatsLine: Color(0xFF6200EE),
      weeklyStatsBelowGradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0x806200EE),
          Color(0x40BB86FC),
        ],
      ),
    ),
    TagsColorScheme(
      gray: Color(0xFFAEAEB2),
      red: Color(0xFFFF453A),
      orange: Color(0xFFFF9F0A),
      yellow: Color(0xFFFFD60A),
      green: Color(0xFF32D74B),
      teal: Color(0xFF64D2FF),
      blue: Color(0xFF0A84FF),
      indigo: Color(0xFF5E5CE6),
      purple: Color(0xFFBF5AF2),
      pink: Color(0xFFFF2D55),
    ),
  ],
);

final defaultDarkTheme = _darkThemeBase.copyWith(
  splashFactory: kIsWeb ? null : InkSparkle.splashFactory,
  inputDecorationTheme: _lightThemeBase.inputDecorationTheme.copyWith(
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
  ),
);
