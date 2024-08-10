import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:not_zero/get_it.dart';
import 'package:not_zero/units/tags/presentation/bloc/tags_selection_cubit.dart';
import 'package:not_zero/units/tags/presentation/view/tag_creation_dialog.dart';
import 'package:nz_flutter_core/nz_flutter_core.dart';
import 'package:nz_tags_models/nz_tags_models.dart';

class ItemTagSelector extends StatelessWidget {
  const ItemTagSelector({
    required this.selectedTags,
    required this.onSelection,
    super.key,
  });

  final Set<String> selectedTags;
  final void Function(List<ItemTag> tags) onSelection;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<TagsSelectionCubit>(),
      child: SizedBox(
        height: 40,
        child: BlocBuilder<TagsSelectionCubit, TagsSelectionState>(
          builder: (context, state) {
            return state.map(
              loading: (state) {
                return const Center(child: LinearProgressIndicator());
              },
              loaded: (state) {
                return ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.tags.length + 1,
                  itemBuilder: (_, index) {
                    if (index == state.tags.length) {
                      return const _AddButton();
                    }

                    final tag = state.tags[index];
                    final isSelected = selectedTags.contains(tag.id);
                    return _TagButton(
                      tag: tag,
                      onPressed: () {
                        if (!isSelected && selectedTags.add(tag.id)) {
                          onSelection(state.filterOn(selectedTags));
                        } else if (selectedTags.remove(tag.id)) {
                          onSelection(state.filterOn(selectedTags));
                        }
                      },
                      selected: isSelected,
                    );
                  },
                  separatorBuilder: (_, __) {
                    return const SizedBox(width: 6);
                  },
                );
              },
            );
          },
        ),
      ),
    );
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
