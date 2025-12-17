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
