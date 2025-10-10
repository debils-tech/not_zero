import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero_app/src/helpers/ref_living_extension.dart';
import 'package:nz_actions_bus/nz_actions_bus.dart';

final actionsBusProvider = Provider<ActionsBus>((ref) {
  return ref.living(ActionsBus());
});
