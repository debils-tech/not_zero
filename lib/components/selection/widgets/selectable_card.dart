import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:not_zero/components/common_widgets/clickable_card.dart';
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

  static const _animDuration = Duration(milliseconds: 150);

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<ItemSelectionBloc>();
    final isSelected = bloc.state.contains(identifier);

    final theme = Theme.of(context);

    void toggleSelection() {
      if (isSelected) {
        bloc.add(ItemSelectionEvent.remove(identifier));
      } else {
        bloc.add(ItemSelectionEvent.add(identifier));
      }
    }

    return AnimatedScale(
      scale: isSelected ? 0.95 : 1,
      duration: _animDuration,
      child: AnimatedContainer(
        decoration: BoxDecoration(
          border: isSelected
              ? Border.all(
                  width: 3.5,
                  color: theme.primaryColor.withOpacity(0.7),
                  strokeAlign: StrokeAlign.center,
                )
              : null,
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        duration: _animDuration,
        child: ClickableCard(
          child: InkWell(
            onTap: bloc.state.isNotEmpty ? toggleSelection : onTap,
            onLongPress: toggleSelection,
            child: child,
          ),
        ),
      ),
    );
  }
}
