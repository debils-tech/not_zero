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

abstract interface class NotZeroBox<T> {
  Future<void> init();

  Future<void> dispose();

  T? value(String key);

  Future<void> put(String key, T value);

  Future<void> putAll(Map<String, T> values);

  Future<void> clear(String key);

  Future<void> clearAll();

  Map<String, T> dump();

  Future<void> deleteBox();
}
