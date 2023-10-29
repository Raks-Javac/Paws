// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:paws/src/core/utls/extensions/extensions.dart';

// void main() {
//   group('AppTheme Extension', () {
//     test('appTheme should return ThemeData', () {
//       final theme = ThemeData.light();
//       final context = TestBuildContext(ThemeData.light());
//       final result = context.appTheme;
//       expect(result, theme);
//     });

//     test('appScreenSize should return Size', () {
//       const screenSize = Size(320, 480);
//       final context =
//           TestBuildContext(ThemeData.light(), screenSize: screenSize);
//       final result = context.appScreenSize;
//       expect(result, screenSize);
//     });

//     test('appTextTheme should return TextTheme', () {
//       final theme = ThemeData.light();
//       final context = TestBuildContext(ThemeData.light());
//       final result = context.appTextTheme;
//       expect(result, theme.textTheme);
//     });
//   });

//   group('Padding Extension', () {
//     test('paddingSymmetric should return Widget with symmetric padding', () {
//       final child = Container();
//       const padding = EdgeInsets.symmetric(vertical: 10, horizontal: 20);
//       final result = child.paddingSymmetric(vertical: 10, horizontal: 20);
//       expect(result is Padding, true);
//       expect((result as Padding).padding, padding);
//       expect((result).child, child);
//     });

//     // Add similar test cases for other padding extension methods
//   });
// }
