// Not Zero, cross-platform wellbeing application.
// Copyright (C) 2025 Nagorny Vladislav
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero_app/src/features/common/view/components/common_widgets/clickable_card.dart';
import 'package:not_zero_app/src/features/common/view/components/selection/di.dart';
import 'package:not_zero_app/src/helpers/build_context_quick_access_ext.dart';

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
              ? .fromBorderSide(
                  BorderSide(
                    width: 3.5,
                    color: context.theme.colorScheme.primary.withValues(
                      alpha: 0.7,
                    ),
                  ),
                )
              : null,
          borderRadius: const .all(.circular(15)),
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
