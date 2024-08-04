import 'package:flutter/material.dart';

class ModalBottomSheetPage<T> extends Page<T> {
  const ModalBottomSheetPage({
    required this.child,
    this.isScrollControlled = true,
    this.useSystemPadding = true,
    this.useKeyboardPadding = true,
  });

  final Widget child;
  final bool isScrollControlled;
  final bool useSystemPadding;
  final bool useKeyboardPadding;

  @override
  Route<T> createRoute(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final modalConstraints = BoxConstraints(
      maxWidth: 500,
      maxHeight: screenHeight - 100,
    );

    return ModalBottomSheetRoute(
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: _keyboardPadding(context) + _systemPadding(context),
        ),
        child: child,
      ),
      settings: this,
      constraints: modalConstraints,
      isScrollControlled: isScrollControlled,
    );
  }

  double _keyboardPadding(BuildContext context) {
    if (useKeyboardPadding) {
      return MediaQuery.viewInsetsOf(context).bottom;
    }
    return 0;
  }

  double _systemPadding(BuildContext context) {
    if (useSystemPadding) {
      return MediaQuery.paddingOf(context).bottom;
    }
    return 0;
  }
}
