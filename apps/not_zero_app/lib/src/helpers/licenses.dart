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

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

void addAppLicenses() {
  LicenseRegistry.addLicense(() async* {
    try {
      final license = await rootBundle.loadString(
        'fonts/SourceCodePro-OFL.txt',
      );
      yield LicenseEntryWithLineBreaks(['google_fonts'], license);
    } on Object catch (_) {
      yield const LicenseEntryWithLineBreaks(
        ['google_fonts'],
        "Can't load license",
      );
    }
  });
}
