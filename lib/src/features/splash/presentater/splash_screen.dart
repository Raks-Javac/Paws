import 'package:flutter/material.dart';
import 'package:paws/src/app/app_locator.dart';
import 'package:paws/src/core/navigation/routes.dart';
import 'package:paws/src/core/utls/extensions/extensions.dart';
import 'package:paws/src/res/assets.dart';
import 'package:paws/src/res/strings.dart';
import 'package:paws/src/res/theme_extensions/app_palette.dart';
import 'package:paws/src/res/theme_extensions/app_typography.dart';
import 'package:paws/src/shared/render_assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4), () {
      appRouter.pushNamedAndRemoveUntil(AppRoute.homeScreen, (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final PawTypography? typography =
        context.appTheme.extension<PawTypography>();
    final PawPallete? palette = context.appTheme.extension<PawPallete>();
    return Scaffold(
        backgroundColor: palette?.primaryColor,
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF9948FF),
                    Color(0xFF8840E2),
                  ],
                ),
              ),
            ),
            const Positioned(
              bottom: 0,
              child: PawsWidgetsRenderSvg(svgPath: dogSplash),
            ),
            Text(
              PawsStrings.appName,
              style: typography?.large?.copyWith(
                color: palette?.backgroundColor,
                fontWeight: FontWeight.bold,
              ),
            ).center
          ],
        ));
  }
}
