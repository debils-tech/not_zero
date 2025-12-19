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

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero_app/src/features/check_in/di.dart';
import 'package:not_zero_app/src/features/check_in/models/check_in_streak_state.dart';
import 'package:not_zero_app/src/features/check_in/view/components/check_in_streak_continues_dialog.dart';
import 'package:not_zero_app/src/features/check_in/view/components/check_in_streak_lost_dialog.dart';
import 'package:not_zero_app/src/features/check_in/view/components/check_in_streak_new_dialog.dart';
import 'package:not_zero_app/src/features/home/view/components/navigation_block.dart';
import 'package:not_zero_app/src/features/home/view/components/stats_header.dart';
import 'package:not_zero_app/src/routes.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final checkInNotifier = ref.watch(checkInStateNotifierProvider.notifier);
    ref.listen(checkInStateNotifierProvider, (_, state) {
      final value = state.value;

      final router = ref.read(appRouterProvider);
      Future<void> onCheckIn() async {
        router.pop();
        await checkInNotifier.checkIn();
      }

      final streakDialog = switch (value) {
        CheckInStreakStateContinued(:final lastCheckIn) =>
          CheckInStreakContinuedDialog(
            streakCount: lastCheckIn.streakCount,
            onCheckIn: onCheckIn,
          ),
        CheckInStreakStateLost(:final lastCheckIn) => CheckInStreakLostDialog(
          streakCount: lastCheckIn.streakCount,
          onCheckIn: onCheckIn,
        ),
        CheckInStreakStateNoCheckIn() => CheckInStreakNewDialog(
          onCheckIn: onCheckIn,
        ),
        _ => null,
      };
      if (streakDialog == null) return;

      unawaited(
        showDialog<void>(
          context: context,
          builder: (_) => streakDialog,
          barrierDismissible: false,
        ),
      );
    });

    return Scaffold(
      body: ListView(
        children: const [
          HomeStatsHeader(),
          HomeNavigationBlock(),
        ],
      ),
    );
  }
}
