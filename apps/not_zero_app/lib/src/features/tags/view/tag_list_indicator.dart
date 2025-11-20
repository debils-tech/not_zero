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
import 'package:nz_base_models/nz_base_models.dart';
import 'package:nz_flutter_core/nz_flutter_core.dart';

class TagListIndicator extends StatelessWidget {
  const TagListIndicator({
    required this.tags,
    this.padding,
    this.borderRadius,
    this.fontSize,
    this.spacing,
    this.runSpacing,
    super.key,
  });

  final List<ItemTag> tags;
  final EdgeInsets? padding;
  final BorderRadiusGeometry? borderRadius;
  final double? fontSize;
  final double? spacing;
  final double? runSpacing;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Wrap(
      spacing: spacing ?? 6,
      runSpacing: runSpacing ?? 4,
      children: tags
          .map(
            (tag) => Container(
              padding:
                  padding ??
                  const .symmetric(
                    horizontal: 6,
                    vertical: 4,
                  ),
              decoration: BoxDecoration(
                borderRadius:
                    borderRadius ?? const .all(.circular(10)),
                color: theme.tagsColorScheme.colorByIndex(tag.colorIndex),
              ),
              child: Text(
                tag.name,
                style: TextStyle(
                  fontSize: fontSize ?? 12,
                  color: theme.scaffoldBackgroundColor,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
