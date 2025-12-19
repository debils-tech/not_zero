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

import 'dart:io';

/// Checks if code is running using `flutter test` or not.
///
/// Mainly used by DB code since it has
/// several problems with paths and isolates.
final isPlatformTest = Platform.environment.containsKey('FLUTTER_TEST');

/// Checks if code is running in CI environment. Can be useful in tests.
const isPlatformCi = bool.fromEnvironment('CI');

final isPlatformDesktop =
    Platform.isLinux || Platform.isMacOS || Platform.isWindows;

final isPlatformMobile = Platform.isAndroid || Platform.isIOS;
