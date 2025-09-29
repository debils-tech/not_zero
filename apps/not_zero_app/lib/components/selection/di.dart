import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero_app/components/selection/notifiers/item_selection_notifier.dart';

final itemSelectionNotifierProvider =
    NotifierProvider.autoDispose<ItemSelectionNotifier, Set<String>>(
      ItemSelectionNotifier.new,
    );
