import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero/units/tags/di.dart';
import 'package:not_zero/units/tags/view/tag_creation_dialog.dart';
import 'package:nz_flutter_core/nz_flutter_core.dart';
import 'package:nz_tags_models/nz_tags_models.dart';

class ItemTagSelector extends ConsumerWidget {
  const ItemTagSelector({
    required this.selectedTags,
    required this.onSelection,
    super.key,
  });

  final Set<String> selectedTags;
  final void Function(List<ItemTag> tags) onSelection;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(tagsListStreamProvider);

    return SizedBox(
      height: 40,
      child: switch (state) {
        AsyncData(value: final tags) => ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: tags.length + 1,
            itemBuilder: (_, index) {
              if (index == tags.length) {
                return const _AddButton();
              }

              final tag = tags[index];
              final isSelected = selectedTags.contains(tag.id);
              return _TagButton(
                tag: tag,
                onPressed: () {
                  final shouldUpdate =
                      !isSelected && selectedTags.add(tag.id) ||
                          selectedTags.remove(tag.id);
                  if (shouldUpdate) {
                    onSelection(_filterTags(tags, selectedTags));
                  }
                },
                selected: isSelected,
              );
            },
            separatorBuilder: (_, __) {
              return const SizedBox(width: 6);
            },
          ),
        _ => const Center(child: LinearProgressIndicator()),
      },
    );
  }

  List<ItemTag> _filterTags(
    List<ItemTag> allTags,
    Set<String> selectedIds,
  ) {
    return allTags.where((tag) => selectedIds.contains(tag.id)).toList();
  }
}

class _TagButton extends StatelessWidget {
  const _TagButton({
    required this.tag,
    required this.onPressed,
    this.selected = false,
  });

  final ItemTag tag;
  final VoidCallback onPressed;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return _RoundedButton(
      selected: selected,
      color: Theme.of(context).tagsColorScheme.colorByIndex(tag.colorIndex),
      onPressed: onPressed,
      onLongPress: () => TagCreationDialog.show(context, tag),
      child: Text(
        tag.name.toUpperCase(),
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          height: 1,
        ),
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  const _AddButton();

  @override
  Widget build(BuildContext context) {
    return _RoundedButton(
      color: Colors.white,
      selected: false,
      onPressed: () => TagCreationDialog.show(context),
      child: const Icon(Icons.add_rounded),
    );
  }
}

class _RoundedButton extends StatelessWidget {
  const _RoundedButton({
    required this.onPressed,
    required this.color,
    required this.selected,
    required this.child,
    this.onLongPress,
  });

  final void Function() onPressed;
  final void Function()? onLongPress;
  final Color color;
  final bool selected;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).scaffoldBackgroundColor;
    return OutlinedButton(
      onPressed: onPressed,
      onLongPress: onLongPress,
      style: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(
          selected ? backgroundColor : color,
        ),
        backgroundColor: selected ? WidgetStatePropertyAll(color) : null,
        side: WidgetStatePropertyAll(
          BorderSide(color: color, width: 3),
        ),
      ),
      child: child,
    );
  }
}
