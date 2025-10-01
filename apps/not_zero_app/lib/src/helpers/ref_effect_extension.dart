import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart';

extension ProviderRefEffectExt on Ref {
  void effect<R>(
    ProviderListenable<R> provider,
    ValueSetter<R> listener,
  ) {
    listener(read(provider));
    listen(provider, (_, value) => listener(value));
  }
}
