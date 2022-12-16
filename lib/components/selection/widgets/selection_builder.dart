import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:not_zero/components/selection/bloc/selection_bloc.dart';

/// Simple class for reducing boilerplate related to selection.
/// Checks if there is any selection in widget tree and calls releated builder.
class SelectionBuilder extends StatelessWidget {
  const SelectionBuilder({
    required this.noSelectionBuilder,
    required this.selectionBuilder,
    super.key,
  });

  /// It called if there is no elements selected.
  final Widget Function(BuildContext context) noSelectionBuilder;

  /// It called if there is at least 1 element selected.
  /// Passes selection state to this builder.
  final Widget Function(BuildContext context, Set<String> state)
      selectionBuilder;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemSelectionBloc, Set<String>>(
      builder: (context, state) {
        if (state.isEmpty) {
          return noSelectionBuilder(context);
        } else {
          return selectionBuilder(context, state);
        }
      },
      buildWhen: (previous, current) => previous != current,
    );
  }
}
