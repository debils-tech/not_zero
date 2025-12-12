import 'package:flutter_confetti/flutter_confetti.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final confettiControllerProvider = Provider.family
    .autoDispose<ConfettiController, Object>((ref, _) => ConfettiController());
