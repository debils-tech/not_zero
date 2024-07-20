import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class AsyncLifecycleObject {
  void init();

  void dispose();

  static T wrapProvider<T extends AsyncLifecycleObject>(
    ProviderRef<T> ref,
    T object,
  ) {
    ref.onDispose(object.dispose);
    object.init();
    return object;
  }
}
