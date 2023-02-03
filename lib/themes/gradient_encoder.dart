import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

class GradientEncoder extends ThemeEncoder<Gradient> {
  const GradientEncoder();

  @override
  Gradient lerp(Gradient a, Gradient b, double t) {
    return Gradient.lerp(a, b, t)!;
  }
}
