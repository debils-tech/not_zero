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
import 'package:nz_common/nz_common.dart';

extension RefLivingExtension on Ref {
  T living<T extends LivingObject>(T livingObject) {
    // FutureOr<void> is not subtype of Future<void>, so can't use unawaited
    // ignore: discarded_futures
    livingObject.init();
    onDispose(() => livingObject.dispose());
    return livingObject;
  }
}
