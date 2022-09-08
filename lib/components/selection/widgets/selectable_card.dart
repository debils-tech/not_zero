import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:not_zero/components/selection/bloc/selection_bloc.dart';
import 'package:not_zero/components/selection/bloc/selection_event.dart';

class SelectableCard extends StatelessWidget {
  const SelectableCard({
    this.onTap,
    required this.identifier,
    required this.child,
    super.key,
  });

  final String identifier;
  final void Function()? onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<ItemSelectionBloc>();
    final isSelected = bloc.state.contains(identifier);

    void toggleSelection() {
      if (isSelected) {
        bloc.add(ItemSelectionEvent.remove(identifier));
      } else {
        bloc.add(ItemSelectionEvent.add(identifier));
      }
    }

    return Material(
      color: isSelected ? Colors.red : Theme.of(context).cardColor,
      elevation: 3,
      borderRadius: BorderRadius.circular(10),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: bloc.state.isNotEmpty ? toggleSelection : onTap,
        onLongPress: toggleSelection,
        child: child,
      ),
    );
  }
}
