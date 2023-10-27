import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paws/src/res/strings.dart';

class PawsTextStyle {
  static TextStyle large = TextStyle(
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    fontFamily: PawsStrings.appPrimaryFontName,
    fontSize: 20.sp,
  );

  static TextStyle medium = TextStyle(
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    fontFamily: PawsStrings.appPrimaryFontName,
    fontSize: 14.sp,
  );

  static TextStyle small = TextStyle(
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    fontFamily: PawsStrings.appPrimaryFontName,
    fontSize: 12.sp,
  );
}
