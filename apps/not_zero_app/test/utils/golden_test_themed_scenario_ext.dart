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

import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:nz_flutter_core/nz_flutter_core.dart';

extension GoldenTestThemedScenarioExt on List<GoldenTestScenario> {
  List<GoldenTestScenario> themed() {
    return expand(
      (scenario) => [
        GoldenTestScenario.builder(
          name: '${scenario.name} (light)',
          builder: (context) => Theme(
            data: defaultLightTheme,
            child: scenario.builder(context),
          ),
        ),
        GoldenTestScenario.builder(
          name: '${scenario.name} (dark)',
          builder: (context) => Theme(
            data: defaultDarkTheme,
            child: scenario.builder(context),
          ),
        ),
      ],
    ).toList();
  }
}
