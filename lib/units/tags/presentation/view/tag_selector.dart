import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:not_zero/get_it.dart';
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
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                if (index == state.tags.length) {
                  return const _AddButton();
                }
                return _TagButton(index);
              },
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemCount: state.tags.length + 1,
            );
          },
        );
      },
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
