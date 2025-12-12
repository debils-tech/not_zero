import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero_app/src/features/settings/di.dart';

class SpecialEffectsNotifier extends Notifier<bool> {
  @override
  bool build() {
    final settingsRepository = ref.watch(settingsRepositoryProvider);
    return settingsRepository.getConfetti();
  }

  void setConfetti(bool value) {
    state = value;
    final settingsRepository = ref.watch(settingsRepositoryProvider);
    unawaited(settingsRepository.setConfetti(value));
  }
}
