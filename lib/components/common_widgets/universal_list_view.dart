import 'package:animated_list_plus/animated_list_plus.dart';
import 'package:animated_list_plus/transitions.dart';
import 'package:flutter/material.dart';
import 'package:not_zero/helpers/object_id_mixin.dart';

class UniversalListView<T extends ObjectIdMixin> extends StatelessWidget {
  const UniversalListView({
    required this.listKey,
    required this.items,
    required this.itemBuilder,
    super.key,
  });

  final Key? listKey;
  final List<T> items;
  final Widget Function(BuildContext context, T item, int index) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return ImplicitlyAnimatedList<T>(
      key: listKey,
      items: items,
      areItemsTheSame: (oldItem, newItem) => oldItem.id == newItem.id,
      insertDuration: const Duration(milliseconds: 300),
      removeDuration: const Duration(milliseconds: 200),
      updateDuration: const Duration(milliseconds: 100),
      padding: const EdgeInsets.only(top: 5, bottom: 75, left: 10, right: 10),
      itemBuilder: (context, animation, item, i) {
        return SizeFadeTransition(
          animation: animation,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: itemBuilder(context, item, i),
          ),
        );
      },
    );
  }
}
