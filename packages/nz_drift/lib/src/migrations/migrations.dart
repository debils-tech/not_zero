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

import 'package:drift/drift.dart';
import 'package:nz_base_models/nz_base_models.dart';
import 'package:nz_drift/nz_drift.dart';
import 'package:nz_drift/src/converters/date_converter.dart';
import 'package:nz_drift/src/db.steps.dart';

part 'from_1_to_2.dart';
part 'from_2_to_3.dart';
part 'from_3_to_4.dart';
part 'from_4_to_5.dart';
part 'from_5_to_6.dart';
part 'from_6_to_7.dart';
part 'from_7_to_8.dart';

Future<int> Function(int, GeneratedDatabase) get notZeroMigrationSteps =>
    migrationSteps(
      from1To2: _from1To2,
      from2To3: _from2To3,
      from3To4: _from3To4,
      from4To5: _from4To5,
      from5To6: _from5To6,
      from6To7: _from6To7,
      from7To8: _from7To8,
    );
