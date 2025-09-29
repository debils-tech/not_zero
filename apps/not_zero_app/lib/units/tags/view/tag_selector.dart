import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero_app/units/tags/di.dart';
import 'package:not_zero_app/units/tags/view/tag_creation_dialog.dart';
import 'package:nz_common/nz_common.dart';
import 'package:nz_flutter_core/nz_flutter_core.dart';
import 'package:nz_base_models/nz_base_models.dart';

class ItemTagSelector extends ConsumerWidget {
  const ItemTagSelector({
    required this.selectedTags,
    required this.onSelection,
    this.showAddButton = true,
    super.key,
  });

  final Set<String> selectedTags;

  // ignore: avoid_positional_boolean_parameters
  final void Function(ItemTag tag, bool isSelected) onSelection;
  final bool showAddButton;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(tagsListStreamProvider);

    return SizedBox(
      height: 35,
      child: switch (state) {
        AsyncData(value: final tags) => ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            ...tags.map((tag) {
              final isSelected = selectedTags.contains(tag.id);
              return _TagButton(
                tag: tag,
                onPressed: (value) => _onTagSelectionExclude(tag, value),
                selected: isSelected,
              );
            }),
            if (showAddButton) const _AddButton(),
          ].listSeparate(const SizedBox(width: 6)),
        ),
        _ => const Center(child: LinearProgressIndicator()),
      },
    );
  }

  void _onTagSelectionExclude(ItemTag tag, bool newValue) {
    final wasSelected = selectedTags.contains(tag.id);
    if (wasSelected == newValue) return;

    onSelection(tag, newValue);
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
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 150),
      child: OutlinedButton(
        key: ValueKey('Tag button: ${color.value} | $selected'),
        onPressed: onPressed,
        onLongPress: onLongPress,
        style: OutlinedButton.styleFrom(
          foregroundColor: selected ? backgroundColor : color,
          backgroundColor: selected ? color : null,
          side: BorderSide(color: color, width: 3),
        ),
        child: child,
      ),
    );
  }
}
