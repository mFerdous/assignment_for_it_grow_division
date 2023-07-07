import 'package:flutter/material.dart';
import 'package:test_task/core/navigation/route_name.dart';

import '../../features/common/presentation/screen/splash_screen.dart';
import '../../features/dashboard/presentation/widget/dashboard.dart';

class RouteConfig {
  Route routes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteName.kLandingScreen:
        return _buildLandingScreen();
      case RouteName.kDashboardRoute:
        return _getDashboardRoute();
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

  static MaterialPageRoute _getDashboardRoute() {
    return _routeBuilder(const Dashboard());
  }
}
