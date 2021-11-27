// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/material.dart' as _i3;

import '../screens/screens.dart' as _i1;

class Router extends _i2.RootStackRouter {
  Router([_i3.GlobalKey<_i3.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    AuthScreenRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.AuthScreen());
    },
    MainScreenRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.MainScreen());
    }
  };

  @override
  List<_i2.RouteConfig> get routes => [
        _i2.RouteConfig(AuthScreenRoute.name, path: '/'),
        _i2.RouteConfig(MainScreenRoute.name, path: '/main-screen')
      ];
}

/// generated route for [_i1.AuthScreen]
class AuthScreenRoute extends _i2.PageRouteInfo<void> {
  const AuthScreenRoute() : super(name, path: '/');

  static const String name = 'AuthScreenRoute';
}

/// generated route for [_i1.MainScreen]
class MainScreenRoute extends _i2.PageRouteInfo<void> {
  const MainScreenRoute() : super(name, path: '/main-screen');

  static const String name = 'MainScreenRoute';
}
