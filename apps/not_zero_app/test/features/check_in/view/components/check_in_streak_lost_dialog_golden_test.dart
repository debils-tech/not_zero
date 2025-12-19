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
import 'package:flutter_test/flutter_test.dart';
import 'package:not_zero_app/src/features/check_in/view/components/check_in_streak_lost_dialog.dart';

import '../../../../fakes/fake_translation_provider.dart';
import '../../../../utils/golden_test_themed_scenario_ext.dart';
import '../../../../utils/golden_test_translations_expanding.dart';

void main() {
  group('CheckIn Dialog Golden Tests (Streak Lost)', () {
    testWithAllTranslations(
      (locale) => goldenTest(
        'renders correctly (${locale.name})',
        fileName: 'check_in_streak_lost_dialog.${locale.languageCode}',
        builder: () => FakeTranslationProvider(
          locale: locale,
          child: GoldenTestGroup(
            scenarioConstraints: const BoxConstraints(maxWidth: 600),
            children: [
              GoldenTestScenario(
                name: 'minimal streak',
                child: CheckInStreakLostDialog(
                  streakCount: 2,
                  onCheckIn: () {},
                ),
              ),
              GoldenTestScenario(
                name: 'sample streak',
                child: CheckInStreakLostDialog(
                  streakCount: 999,
                  onCheckIn: () {},
                ),
              ),
            ].themed(),
          ),
        ),
      ),
    );
  });
}
