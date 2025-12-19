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

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero_app/src/features/actions_bus/di.dart';
import 'package:not_zero_app/src/features/check_in/notifiers/check_in_state_notifier.dart';
import 'package:not_zero_app/src/features/check_in/repositories/check_in_repository.dart';
import 'package:not_zero_app/src/features/check_in/services/check_in_local_service.dart';
import 'package:not_zero_app/src/features/storage/di.dart';

final checkInLocalServiceProvider = Provider<CheckInLocalService>((ref) {
  return CheckInLocalService(
    ref.watch(databaseProvider),
  );
});

final checkInRepositoryProvider = Provider<CheckInRepository>((ref) {
  return CheckInRepository(
    ref.watch(checkInLocalServiceProvider),
    ref.watch(actionsBusProvider),
  );
});

final checkInStateNotifierProvider = AsyncNotifierProvider.autoDispose(
  CheckInStateNotifier.new,
);
