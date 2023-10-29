import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paws/src/features/home/presenter/home_screen.dart';
import 'package:paws/src/features/home/presenter/sub_breed_view.dart';
import 'package:paws/src/features/splash/presentater/splash_screen.dart';

class AppRoute {
  static const String splashScreen = '/splashScreen';
  static const String homeScreen = '/homeScreen';
  static const String subBreedView = '/subBreedView';

  final routes = {
    splashScreen: (context) => const SplashScreen(),
  };

  static Route getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case homeScreen:
        return _getPageRoute(routeSettings, HomeScreen());
      case subBreedView:
        return _getPageRoute(routeSettings, const SubBreedViewScreen());

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
