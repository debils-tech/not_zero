import 'package:flutter/material.dart';

class ModalBottomSheetPage<T> extends Page<T> {
  const ModalBottomSheetPage({
    required this.child,
    this.isScrollControlled = true,
  });

  final Widget child;
  final bool isScrollControlled;

  @override
  Route<T> createRoute(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final modalConstraints = BoxConstraints(
      maxWidth: 500,
      maxHeight: screenHeight * 0.6,
    );

    return ModalBottomSheetRoute(
      builder: (_) => child,
      settings: this,
      constraints: modalConstraints,
      isScrollControlled: isScrollControlled,
    );
  }
}
