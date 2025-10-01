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
                  const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 4,
                  ),
              decoration: BoxDecoration(
                borderRadius:
                    borderRadius ?? const BorderRadius.all(Radius.circular(10)),
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
