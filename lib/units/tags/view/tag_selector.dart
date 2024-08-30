import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero/units/tags/di.dart';
import 'package:not_zero/units/tags/view/tag_creation_dialog.dart';
import 'package:nz_common/nz_common.dart';
import 'package:nz_flutter_core/nz_flutter_core.dart';
import 'package:nz_tags_models/nz_tags_models.dart';

class ItemTagSelector extends ConsumerWidget {
  const ItemTagSelector({
    required this.selectedTags,
    required this.onSelection,
    this.showAddButton = true,
    this.excludeSelection = false,
    super.key,
  });

  final Set<String> selectedTags;
  final void Function(List<ItemTag> tags) onSelection;
  final bool showAddButton;
  final bool excludeSelection;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(tagsListStreamProvider);

    return SizedBox(
      height: 40,
      child: switch (state) {
        AsyncData(value: final tags) => ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              ...tags.map((tag) {
                final isSelected = selectedTags.contains(tag.id);
                return _TagButton(
                  tag: tag,
                  onPressed: (value) => excludeSelection
                      ? _onTagSelectionExclude(tag, value)
                      : _onTagSelection(tags, tag, value),
                  selected: isSelected,
                );
              }),
              if (showAddButton) const _AddButton(),
            ].insertSeparators(const SizedBox(width: 6)),
          ),
        _ => const Center(child: LinearProgressIndicator()),
      },
    );
  }

  void _onTagSelectionExclude(ItemTag tag, bool newValue) {
    final wasSelected = selectedTags.contains(tag.id);
    if (wasSelected == newValue) return;

    if (newValue) {
      onSelection([tag]);
    } else {
      onSelection([]);
    }
  }

  void _onTagSelection(List<ItemTag> tags, ItemTag tag, bool newValue) {
    final newSelectedTags = {...selectedTags};
    final shouldUpdate = newValue && newSelectedTags.add(tag.id) ||
        newSelectedTags.remove(tag.id);
    if (shouldUpdate) {
      onSelection(_filterTags(tags, newSelectedTags));
    }
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
  final ValueChanged<bool> onPressed;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return _RoundedButton(
      selected: selected,
      color: Theme.of(context).tagsColorScheme.colorByIndex(tag.colorIndex),
      onPressed: () => onPressed(!selected),
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
