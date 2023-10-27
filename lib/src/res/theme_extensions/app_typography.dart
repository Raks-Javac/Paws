import 'package:flutter/material.dart';

@immutable
class AppTypography extends ThemeExtension<AppTypography> {
  const AppTypography({
    required this.large,
    required this.medium,
    required this.small,
  });

  final TextStyle? large;

  final TextStyle? medium;

  final TextStyle? small;

  @override
  AppTypography copyWith({
    TextStyle? large,
    TextStyle? medium,
    TextStyle? small,
  }) {
    return AppTypography(
      large: large ?? this.large,
      medium: medium ?? this.medium,
      small: small ?? this.small,
    );
  }

  @override
  AppTypography lerp(AppTypography? other, double t) {
    if (other is! AppTypography) {
      return this;
    }
    return AppTypography(
      large: TextStyle.lerp(large, other.large, t),
      medium: TextStyle.lerp(medium, other.medium, t),
      small: TextStyle.lerp(small, other.small, t),
    );
  }
}
