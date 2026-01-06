// Not Zero, cross-platform wellbeing application.
// Copyright (C) 2026 Nagorny Vladislav
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

import 'package:image/image.dart' as img;

const _appPackageRoot = 'apps/not_zero_app';

void main() async {
  await _resizeAppIconForAndroidFastlane();

  print('Done!');
}

Future<void> _resizeAppIconForAndroidFastlane() async {
  print('Resizing app icon for Android Fastlane...');

  const appIconPath = '$_appPackageRoot/assets/icon-1024x1024.png';
  const fastlaneIconPath =
      '$_appPackageRoot/android/fastlane/metadata/android/en-US/images/icon.png';
  final cmd = img.Command()
    ..decodeImageFile(appIconPath)
    ..copyResize(width: 512, height: 512)
    ..encodePngFile(fastlaneIconPath);

  await cmd.executeThread();
}
