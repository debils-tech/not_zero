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

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero_app/src/features/settings/di.dart';

class SpecialEffectsNotifier extends Notifier<bool> {
  @override
  bool build() {
    final settingsRepository = ref.watch(settingsRepositoryProvider);
    return settingsRepository.getConfetti();
  }

  void setConfetti(bool value) {
    state = value;
    final settingsRepository = ref.watch(settingsRepositoryProvider);
    unawaited(settingsRepository.setConfetti(value));
  }
}
