import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:not_zero_app/src/features/check_in/view/components/check_in_streak_continues_dialog.dart';

import '../../../../fakes/fake_translation_provider.dart';
import '../../../../utils/golden_test_themed_scenario_ext.dart';
import '../../../../utils/golden_test_translations_expanding.dart';

void main() {
  group('CheckIn Dialog Golden Tests (Streak Continued)', () {
    testWithAllTranslations(
      (locale) => goldenTest(
        'renders correctly (${locale.name})',
        fileName: 'check_in_streak_continues_dialog.${locale.languageCode}',
        builder: () => FakeTranslationProvider(
          locale: locale,
          child: GoldenTestGroup(
            children: [
              GoldenTestScenario(
                name: 'minimal streak',
                child: Dialog(
                  child: CheckInStreakContinuedDialogContent(
                    streakCount: 2,
                    onCheckIn: () {},
                  ),
                ),
              ),
              GoldenTestScenario(
                name: 'sample streak',
                child: Dialog(
                  child: CheckInStreakContinuedDialogContent(
                    streakCount: 999,
                    onCheckIn: () {},
                  ),
                ),
              ),
            ].themed(),
          ),
        ),
      ),
    );
  });
}
