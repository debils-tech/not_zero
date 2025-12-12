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
