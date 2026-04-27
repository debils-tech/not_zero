// Not Zero, cross-platform wellbeing application.
// Copyright (C) 2026 Nagorny Vladislav
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

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
