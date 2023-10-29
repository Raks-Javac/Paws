import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paws/src/app/app_locator.dart';
import 'package:paws/src/core/navigation/navigator_key.dart';
import 'package:paws/src/core/navigation/routes.dart';
import 'package:paws/src/res/strings.dart';
import 'package:paws/src/res/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const PawApp());
}

class PawApp extends StatelessWidget {
  const PawApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: providers,
        builder: (context, child) {
          return ScreenUtilInit(
              designSize: const Size(375, 812),
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (context, child) {
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: MaterialApp(
                    title: PawsStrings.appName,
                    theme: PawThemes.lightTheme,
                    onGenerateRoute: AppRoute.getRoute,
                    darkTheme: PawThemes.lightTheme,
                    debugShowCheckedModeBanner: false,
                    routes: AppRoute().routes,
                    navigatorKey: NavigatorKey.appNavigatorKey,
                    initialRoute: AppRoute.splashScreen,
                  ),
                );
              });
        });
  }
}
