import 'package:flutter/material.dart';
import 'package:nz_flutter_core/nz_flutter_core.dart';

class ChartCard extends StatelessWidget {
  const ChartCard({
    required this.child,
    required this.innerHeight,
    super.key,
    EdgeInsets? padding,
  }) : padding =
           padding ??
           const .symmetric(
             horizontal: 30,
             vertical: 15,
           );

  final Widget child;
  final double innerHeight;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const .all(.circular(16)),
      color: context.theme.chartsColorScheme.chartBackgroundColor,
      elevation: 7,
      child: Container(
        padding: padding,
        height: innerHeight,
        child: child,
      ),
    );
  }
}
