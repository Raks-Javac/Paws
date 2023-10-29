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
      fontFamily: PawsStrings.appPrimaryFontName,
      // scaffoldBackgroundColor: PawAppColors.pawWhite,
      brightness: Brightness.light,
      extensions: <ThemeExtension<dynamic>>[
        const PawPallete(
          textColor: PawAppColors.pawBlack,
          backgroundColor: PawAppColors.pawWhite,
          primaryColor: PawAppColors.primaryColor,
        ),
        PawTypography(
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
      fontFamily: PawsStrings.appPrimaryFontName,
      // scaffoldBackgroundColor: PawAppColors.pawBlack,
      brightness: Brightness.dark,
      extensions: <ThemeExtension<dynamic>>[
        const PawPallete(
          textColor: PawAppColors.pawWhite,
          backgroundColor: PawAppColors.pawBlack,
          primaryColor: PawAppColors.primaryColor,
        ),
        PawTypography(
          large: PawsTextStyle.large,
          medium: PawsTextStyle.medium,
          small: PawsTextStyle.small,
        ),
      ],
    );
  }
}
