import 'package:flutter/material.dart';

@immutable
class PawTypography extends ThemeExtension<PawTypography> {
  const PawTypography({
    required this.large,
    required this.medium,
    required this.small,
  });

  final TextStyle? large;

  final TextStyle? medium;

  final TextStyle? small;

  @override
  PawTypography copyWith({
    TextStyle? large,
    TextStyle? medium,
    TextStyle? small,
  }) {
    return PawTypography(
      large: large ?? this.large,
      medium: medium ?? this.medium,
      small: small ?? this.small,
    );
  }

  @override
  PawTypography lerp(PawTypography? other, double t) {
    if (other is! PawTypography) {
      return this;
    }
    return PawTypography(
      large: TextStyle.lerp(large, other.large, t),
      medium: TextStyle.lerp(medium, other.medium, t),
      small: TextStyle.lerp(small, other.small, t),
    );
  }
}
