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

extension IterableSeparator<T> on Iterable<T> {
  Iterable<T> separateWith(T divider) sync* {
    final originalIterator = iterator..moveNext();
    for (var i = 0; i < length; i++) {
      yield originalIterator.current;
      if (originalIterator.moveNext()) yield divider;
    }
  }

  List<T> listSeparate(T divider) =>
      separateWith(divider).toList(growable: false);
}
