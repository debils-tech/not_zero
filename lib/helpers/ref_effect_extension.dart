import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension ProviderRefEffectExt<T> on Ref<T> {
  void effect<R>(
    AlwaysAliveProviderListenable<R> provider,
    ValueSetter<R> listener,
  ) {
    listener(read(provider));
    listen(provider, (_, value) => listener(value));
  }
}

extension ProviderAutoDisposeRefEffectExt<T> on AutoDisposeRef<T> {
  void effect<R>(
    ProviderListenable<R> provider,
    ValueSetter<R> listener,
  ) {
    listener(read(provider));
    listen(provider, (_, value) => listener(value));
  }
}
