import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nz_common/nz_common.dart';

extension RefLivingExtension on Ref {
  T living<T extends LivingObject>(T livingObject) {
    // FutureOr<void> is not subtype of Future<void>, so can't use unawaited
    // ignore: discarded_futures
    livingObject.init();
    onDispose(() => livingObject.dispose());
    return livingObject;
  }
}
