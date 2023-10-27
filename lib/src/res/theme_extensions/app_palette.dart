import 'package:flutter/material.dart';

@immutable
class Palette extends ThemeExtension<Palette> {
  const Palette({
    required this.textColor,
    required this.backgroundColor,
  });

  // This is how we will determine the design color system to help us respect light and dark mode
  final Color? textColor;

  final Color? backgroundColor;

  @override
  Palette copyWith({
    Color? textColor,
    Color? backgroundColor,
  }) {
    return Palette(
      textColor: textColor ?? this.textColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }

  @override
  Palette lerp(Palette? other, double t) {
    if (other is! Palette) {
      return this;
    }
    return Palette(
      textColor: Color.lerp(textColor, other.textColor, t),
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
    );
  }
}
