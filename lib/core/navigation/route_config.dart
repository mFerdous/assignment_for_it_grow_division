import 'package:flutter/material.dart';
import 'package:test_task/core/navigation/route_name.dart';
import 'package:test_task/features/sign_in/presentation/screen/sign_in_screen.dart';

import '../../features/common/presentation/screen/splash_screen.dart';
import '../../features/open_trades/presentation/screen/open_trades_screen.dart';
import '../../features/profile_info/presentation/screen/profile_info_screen.dart';

class RouteConfig {
  Route routes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteName.kLandingScreen:
        return _buildLandingScreen();
      case RouteName.kSignInRoute:
        return _getSignInRoute();
      case RouteName.kProfileRoute:
        return _getProfileRoute();
      case RouteName.kOpenTradeRoute:
        return _getOpenTradeRoute();
    }
    return _defaultRoute();
  }

  static MaterialPageRoute _routeBuilder(Widget child) {
    return MaterialPageRoute(builder: (_) => child);
  }

  static MaterialPageRoute _defaultRoute() {
    return _routeBuilder(
      const Scaffold(
        body: Center(
          child: Text('Default route'),
        ),
      ),
    );
  }

  MaterialPageRoute _buildLandingScreen() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: RouteName.kLandingScreen),
      builder: (context) {
        return const SplashScreen();
      },
    );
  }

  static MaterialPageRoute _getSignInRoute() {
    return _routeBuilder(const SignInScreen());
  }

  static MaterialPageRoute _getProfileRoute() {
    return _routeBuilder(ProfileInfoScreen());
  }

  static MaterialPageRoute _getOpenTradeRoute() {
    return _routeBuilder(OpenTradesScreen());
  }
}
