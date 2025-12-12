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
