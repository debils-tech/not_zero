import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nz_flutter_core/src/components/selection/notifiers/item_selection_notifier.dart';

final itemSelectionNotifierProvider = NotifierProvider.autoDispose(
  ItemSelectionNotifier.new,
);
