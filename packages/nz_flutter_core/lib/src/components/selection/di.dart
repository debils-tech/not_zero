import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'notifiers/item_selection_notifier.dart';

final NotifierProvider<ItemSelectionNotifier, Set<String>>
itemSelectionNotifierProvider =
    NotifierProvider.autoDispose<ItemSelectionNotifier, Set<String>>(
      ItemSelectionNotifier.new,
    );
