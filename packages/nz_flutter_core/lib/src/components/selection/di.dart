import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'notifiers/item_selection_notifier.dart';

final itemSelectionNotifierProvider = NotifierProvider.autoDispose(
  ItemSelectionNotifier.new,
);
