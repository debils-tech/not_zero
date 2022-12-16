import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:not_zero/components/selection/bloc/selection_bloc.dart';
import 'package:not_zero/components/selection/bloc/selection_event.dart';
import 'package:not_zero/components/selection/widgets/selection_builder.dart';

class SelectionAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SelectionAppBar({
    required this.noSelectionTitle,
    required this.selectionTitle,
    required this.fullSelection,
    this.height = 60,
    super.key,
  });

  final Widget Function(BuildContext context) noSelectionTitle;
  final Widget Function(BuildContext context, int selectedCount) selectionTitle;

  final Set<String> Function()? fullSelection;

  final double height;

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return SelectionBuilder(
      noSelectionBuilder: (context) {
        return AppBar(title: noSelectionTitle(context));
      },
      selectionBuilder: (context, state) {
        final selectionBloc = context.read<ItemSelectionBloc>();

        return AppBar(
          title: selectionTitle(context, state.length),
          actions: [
            if (fullSelection != null)
              IconButton(
                onPressed: () {
                  selectionBloc
                      .add(ItemSelectionEvent.addAll(fullSelection!()));
                },
                icon: const Icon(Icons.select_all),
              ),
            IconButton(
              onPressed: () {
                selectionBloc.add(const ItemSelectionEvent.removeAll(null));
              },
              icon: const Icon(Icons.close),
            ),
          ],
        );
      },
    );
  }
}
