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

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_confetti/flutter_confetti.dart';

class EmojiConfettiWidget extends StatelessWidget {
  const EmojiConfettiWidget({
    required this.controller,
    this.options,
    super.key,
  });

  final ConfettiController controller;
  final ConfettiOptions? options;

  static final _random = Random();

  static const defaultOptions = ConfettiOptions(
    particleCount: 20,
    spread: 360,
    gravity: 0.1,
    startVelocity: 10,
    decay: 0.8,
    ticks: 50,
    scalar: 0.75,
  );

  @override
  Widget build(BuildContext context) {
    const emojiVariants = ['⭐', '🏆', '❤️', '🔥'];
    final emojiParticle = Emoji(
      emoji: emojiVariants[_random.nextInt(emojiVariants.length)],
    );

    return Confetti(
      controller: controller,
      options: options ?? defaultOptions,
      particleBuilder: (_) => emojiParticle,
    );
  }
}
