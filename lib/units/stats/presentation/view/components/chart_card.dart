import 'package:flutter/material.dart';
import 'package:not_zero/themes/charts_colors.dart';

class ChartCard extends StatelessWidget {
  const ChartCard({
    super.key,
    required this.child,
    required this.innerHeight,
    EdgeInsets? padding,
  }) : padding = padding ??
            const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 15,
            );

  final Widget child;
  final double innerHeight;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      height: innerHeight + padding.vertical,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        color: Theme.of(context).chartsColorScheme.chartBackgroundColor,
      ),
      child: child,
    );
  }
}
