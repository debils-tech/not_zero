import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// Custom scroll behavior for dragging with mouse on desktop
///
/// Temporary: should be implemented different interface on desktop/web
class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}
