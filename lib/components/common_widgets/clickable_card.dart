import 'package:flutter/material.dart';

class ClickableCard extends StatelessWidget {
  const ClickableCard({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).cardColor,
      elevation: 3,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      clipBehavior: Clip.antiAlias,
      child: child,
    );
  }
}
