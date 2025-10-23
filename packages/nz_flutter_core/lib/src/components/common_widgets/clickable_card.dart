import 'package:flutter/material.dart';
import 'package:nz_flutter_core/nz_flutter_core.dart';

class ClickableCard extends StatelessWidget {
  const ClickableCard({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: context.theme.cardTheme.color,
      elevation: 2,
      clipBehavior: Clip.antiAlias,
      child: child,
    );
  }
}
