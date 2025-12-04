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
import 'package:not_zero_app/src/constants/box_names.dart';
import 'package:nz_boxes/nz_boxes.dart';
import 'package:nz_common/nz_common.dart';
import 'package:nz_drift/nz_drift.dart';

final databaseProvider = Provider<NotZeroDatabase>((ref) {
  if (isPlatformTest) {
    // It will be generally better to run test on faster database.
    //
    // Also it helps to avoid problems with complex things like drift isolates.
    return NotZeroDatabase.memory();
  }

  return NotZeroDatabase();
});

final settingsBoxProvider = Provider<NotZeroSimpleBox>((ref) {
  return NotZeroSimpleBox(BoxNames.settings);
});
