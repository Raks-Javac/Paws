import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paws/src/features/splash/presentater/splash_screen.dart';

class AppRoute {
  static const String splashScreen = '/splashScreen';

  final routes = {
    splashScreen: (context) => const SplashScreen(),
  };

  static Route getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      // case transferView:
      //   TransferViewArgument args =
      //       routeSettings.arguments as TransferViewArgument;
      //   return _getPageRoute(
      //       routeSettings,
      //       TransferView(
      //         transferViewArgument: args,
      //       ));

      default:
        return _getPageRoute(
          routeSettings,
          const SplashScreen(),
        );
    }
  }

  static Route _getPageRoute(
    RouteSettings routeSettings,
    Widget screen, {
    bool isFullScreen = false,
  }) {
    if (Platform.isIOS) {
      return CupertinoPageRoute(
        settings: routeSettings,
        builder: (context) => screen,
        fullscreenDialog: isFullScreen,
      );
    }
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (context) => screen,
      fullscreenDialog: isFullScreen,
    );
  }
}
