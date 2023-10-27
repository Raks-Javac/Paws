import 'package:flutter/material.dart';
import 'package:paws/src/res/colors.dart';
import 'package:paws/src/res/strings.dart';
import 'package:paws/src/res/text_styles.dart';
import 'package:paws/src/res/theme_extensions/app_palette.dart';
import 'package:paws/src/res/theme_extensions/app_typography.dart';

class PawThemes {
  // Light Theme
  static ThemeData get lightTheme {
    return ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: PawAppColors.pawWhite,
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: PawAppColors.pawBlack,
        ),
        titleTextStyle: PawsTextStyle.medium.copyWith(
          color: PawAppColors.pawBlack,
        ),
        elevation: 0,
      ),
      fontFamily: PawsStrings.appPrimaryFontName,
      scaffoldBackgroundColor: PawAppColors.pawWhite,
      brightness: Brightness.light,
      extensions: <ThemeExtension<dynamic>>[
        const Palette(
          textColor: PawAppColors.pawBlack,
          backgroundColor: PawAppColors.pawWhite,
        ),
        AppTypography(
          large: PawsTextStyle.large,
          medium: PawsTextStyle.medium,
          small: PawsTextStyle.small,
        ),
      ],
    );
  }

  // Dark Theme
  static ThemeData get darkTheme {
    return ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: PawAppColors.pawBlack,
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: PawAppColors.pawWhite,
        ),
        titleTextStyle: PawsTextStyle.medium.copyWith(
          color: PawAppColors.pawWhite,
        ),
        elevation: 0,
      ),
      fontFamily: PawsStrings.appPrimaryFontName,
      scaffoldBackgroundColor: PawAppColors.pawBlack,
      brightness: Brightness.dark,
      extensions: <ThemeExtension<dynamic>>[
        const Palette(
            textColor: PawAppColors.pawWhite,
            backgroundColor: PawAppColors.pawBlack),
        AppTypography(
          large: PawsTextStyle.large,
          medium: PawsTextStyle.medium,
          small: PawsTextStyle.small,
        ),
      ],
    );
  }
}
