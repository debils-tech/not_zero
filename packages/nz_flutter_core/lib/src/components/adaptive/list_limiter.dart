import 'package:flutter/material.dart';

/// Widget for limiting width of items in any list
class AdaptiveListLimiter extends StatelessWidget {
  const AdaptiveListLimiter({
    required this.child,
    this.maxWidth = 500,
    super.key,
  });

  final double maxWidth;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: maxWidth,
        ),
        child: child,
      ),
    );
  }
}
