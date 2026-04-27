import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract final class NzRobotoFlex {
  static const fontFamily = 'RobotoFlex';
  static const package = 'nz_fonts';

  static TextTheme modifyTextTheme(TextTheme textTheme) => textTheme.copyWith(
    displayLarge: textTheme.displayLarge?.copyWith(
      fontWeight: FontWeight.w800,
      letterSpacing: -1.5,
      height: 1.1,
    ),
  );

  static Future<String> license() => rootBundle.loadString(
    'packages/$package/lib/fonts/RobotoFlex/OFL.txt',
  );
}
