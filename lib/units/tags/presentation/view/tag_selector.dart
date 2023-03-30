import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:not_zero/get_it.dart';
import 'package:not_zero/themes/tags_colors.dart';
import 'package:not_zero/units/tags/domain/models/tag.dart';
import 'package:not_zero/units/tags/presentation/bloc/tags_selection_bloc.dart';
import 'package:not_zero/units/tags/presentation/view/tag_creation_dialog.dart';

class ItemTagSelector extends StatelessWidget {
  const ItemTagSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<TagsSelectionBloc>()..add(const TagsSelectionEvent.loadTags()),
      child: const SizedBox(
        height: 40,
        child: _SelectorBody(),
      ),
    );
  }
}

class _SelectorBody extends StatelessWidget {
  const _SelectorBody();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TagsSelectionBloc, TagsSelectionState>(
      builder: (context, state) {
        return state.map(
          loading: (state) {
            return const Center(child: CircularProgressIndicator());
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
                return _TagButton(
                  tag,
                  selected: state.selected.contains(tag.id),
                );
              },
              separatorBuilder: (_, __) {
                return const SizedBox(width: 6);
              },
            );
          },
        );
      },
    );
  }
}

class _TagButton extends StatelessWidget {
  const _TagButton(this.tag, {this.selected = false});

  final ItemTag tag;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return _RoundedButton(
      selected: selected,
      color: Theme.of(context).tagsColorScheme.colorByIndex(tag.colorIndex),
      onPressed: () => context
          .read<TagsSelectionBloc>()
          .add(TagsSelectionEvent.selectTag(tag.id)),
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
        foregroundColor: MaterialStatePropertyAll(
          selected ? backgroundColor : color,
        ),
        backgroundColor: selected ? MaterialStatePropertyAll(color) : null,
        side: MaterialStatePropertyAll(
          BorderSide(color: color, width: 3),
        ),
      ),
      child: child,
    );
  }
}
