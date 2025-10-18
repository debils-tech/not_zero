import 'dart:async';

abstract interface class LivingObject {
  FutureOr<void> init();

  FutureOr<void> dispose();
}
