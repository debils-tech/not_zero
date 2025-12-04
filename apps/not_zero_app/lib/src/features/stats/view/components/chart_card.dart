// Not Zero, cross-platform wellbeing application.
// Copyright (C) 2025 Nagorny Vladislav
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
import 'package:nz_flutter_core/nz_flutter_core.dart';

class ChartCard extends StatelessWidget {
  const ChartCard({
    required this.child,
    required this.innerHeight,
    super.key,
    EdgeInsets? padding,
  }) : padding =
           padding ??
           const .symmetric(
             horizontal: 30,
             vertical: 15,
           );

  final Widget child;
  final double innerHeight;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const .all(.circular(16)),
      color: context.theme.chartsColorScheme.chartBackgroundColor,
      elevation: 7,
      child: Container(
        padding: padding,
        height: innerHeight,
        child: child,
      ),
    );
  }
}
