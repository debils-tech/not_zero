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

import 'package:flutter/material.dart';
import 'package:flutter_confetti/flutter_confetti.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero_app/src/features/settings/di.dart';
import 'package:not_zero_app/src/features/special_effects/view/components/emoji_confetti_widget.dart';

class EmojiConfettiWrapper extends ConsumerWidget {
  const EmojiConfettiWrapper({
    required this.controller,
    required this.child,
    this.options,
    super.key,
  });

  final ConfettiController controller;
  final Widget child;
  final ConfettiOptions? options;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final confettiEnabled = ref.watch(specialEffectsNotifierProvider);
    if (!confettiEnabled) {
      return child;
    }

    return Stack(
      children: [
        Positioned.fill(
          child: EmojiConfettiWidget(
            controller: controller,
            options: options,
          ),
        ),
        child,
      ],
    );
  }
}
