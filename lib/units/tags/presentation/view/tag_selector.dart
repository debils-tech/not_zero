import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:not_zero/get_it.dart';
import 'package:not_zero/units/tags/domain/models/tag.dart';
import 'package:not_zero/units/tags/presentation/bloc/events/tags_selection_events.dart';
import 'package:not_zero/units/tags/presentation/bloc/states/tags_selection_states.dart';
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
            return const CircularProgressIndicator();
          },
          loaded: (state) {
            return _TagsList(
              itemBuilder: (index) {
                final tag = state.tags[index];
                return _TagButton(
                  tag,
                  selected: state.selected.contains(tag.id),
                );
              },
              separatorBuilder: () => const SizedBox(width: 8),
              addButtonBuilder: () => const _AddButton(),
              itemCount: state.tags.length,
            );
          },
        );
      },
    );
  }
}

class _TagsList extends StatelessWidget {
  const _TagsList({
    required this.itemBuilder,
    required this.separatorBuilder,
    required this.addButtonBuilder,
    required this.itemCount,
  });

  final Widget Function(int index) itemBuilder;
  final Widget Function() separatorBuilder;
  final Widget Function() addButtonBuilder;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    final wrapLength = itemCount * 2 + 1;
    return Wrap(
      children: List.generate(
        wrapLength,
        (index) {
          if (index.isOdd) {
            return separatorBuilder();
          }

          final itemIndex = index ~/ 2;
          if (itemIndex == itemCount) {
            return addButtonBuilder();
          }

          return itemBuilder(itemIndex);
        },
      ),
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
      color: tag.color ?? Colors.white,
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
