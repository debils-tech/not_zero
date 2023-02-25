import 'package:flutter/material.dart';
import 'package:not_zero/units/tags/presentation/view/tag_creation_dialog.dart';

class ItemTagSelector extends StatelessWidget {
  const ItemTagSelector({super.key});

  @override
  Widget build(BuildContext context) {
    const length = 1;

    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          if (index == length) {
            return const _AddButton();
          }
          return _TagButton(index);
        },
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemCount: length + 1,
      ),
    );
  }
}

class _TagButton extends StatelessWidget {
  const _TagButton(this.index);

  final int index;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => print('Selected $index'),
      child: Text('Nice tag #$index'),
    );
  }
}

class _AddButton extends StatelessWidget {
  const _AddButton();

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => TagCreationDialog.show(context),
      child: const Icon(Icons.add_rounded),
    );
  }
}
