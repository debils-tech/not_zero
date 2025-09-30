import 'package:flutter_riverpod/flutter_riverpod.dart';

class ItemSelectionNotifier extends Notifier<Set<String>> {
  @override
  Set<String> build() {
    return const {};
  }

  void add(String item) => state = {...state, item};

  void remove(String item) => state = {...state}..remove(item);

  void addAll(Set<String> items) => state = {...state, ...items};

  void removeAll() => state = build();
}
