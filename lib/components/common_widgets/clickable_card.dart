import 'package:flutter/material.dart';

class ClickableCard extends StatelessWidget {
  const ClickableCard({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).cardTheme.color,
      elevation: 2,
      clipBehavior: Clip.antiAlias,
      child: child,
    );
  }
}
