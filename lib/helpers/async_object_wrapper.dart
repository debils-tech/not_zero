import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nz_common/nz_common.dart';

T asyncRef<T extends AsyncObject>(Ref ref, T instance) {
  ref.onDispose(instance.dispose);
  instance.init();
  return instance;
}
