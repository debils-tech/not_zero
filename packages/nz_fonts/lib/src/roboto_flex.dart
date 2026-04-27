import 'package:flutter/material.dart';

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
}
