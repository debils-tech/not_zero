import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract interface class AsyncLifecycleObject {
  FutureOr<void> init();

  FutureOr<void> dispose();

  static T wrapProvider<T extends AsyncLifecycleObject>(
    ProviderRef<T> ref,
    T object, {
    bool callInit = true,
    bool callDispose = true,
  }) {
    if (callDispose) ref.onDispose(object.dispose);
    if (callInit) object.init();
    return object;
  }
}
