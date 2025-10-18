import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common_widgets/clickable_card.dart';
import '../di.dart';

class SelectableCard extends ConsumerWidget {
  const SelectableCard({
    required this.identifier,
    required this.child,
    this.onTap,
    super.key,
  });

  final String identifier;
  final void Function()? onTap;
  final Widget child;

  static const _animDuration = Duration(milliseconds: 200);
  static const _animCurve = Curves.easeInOut;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(itemSelectionNotifierProvider.notifier);

    final isSelected = ref.watch(
      itemSelectionNotifierProvider.select(
        (selection) => selection.contains(identifier),
      ),
    );
    final selectionIsActive = ref.watch(
      itemSelectionNotifierProvider.select((selection) => selection.isNotEmpty),
    );

    final theme = Theme.of(context);

    void toggleSelection() {
      if (isSelected) {
        notifier.remove(identifier);
      } else {
        notifier.add(identifier);
      }
    }

    return AnimatedScale(
      scale: isSelected ? 0.95 : 1,
      duration: _animDuration,
      curve: _animCurve,
      child: AnimatedContainer(
        decoration: BoxDecoration(
          border: isSelected
              ? Border.all(
                  width: 3.5,
                  color: theme.colorScheme.primary.withValues(alpha: 0.7),
                )
              : null,
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        duration: _animDuration,
        curve: _animCurve,
        child: ClickableCard(
          child: InkWell(
            onTap: selectionIsActive ? toggleSelection : onTap,
            onLongPress: toggleSelection,
            child: child,
          ),
        ),
      ),
    );
  }
}
