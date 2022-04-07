// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../../features/home/presentation/pages/home_page.dart' as _i4;
import '../../features/login/presentation/pages/login_page.dart' as _i1;
import '../../features/others/presentation/pages/not_found_page.dart' as _i3;
import '../../features/others/presentation/pages/under_development_page.dart'
    as _i2;
import 'auth_guard.dart' as _i7;

class AppRouter extends _i5.RootStackRouter {
  AppRouter(
      {_i6.GlobalKey<_i6.NavigatorState>? navigatorKey,
      required this.authGuard})
      : super(navigatorKey);

  final _i7.AuthGuard authGuard;

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.LoginPage());
    },
    UnderDevelopmentRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.UnderDevelopmentPage());
    },
    NotFoundRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.NotFoundPage());
    },
    HomeRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.HomePage());
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(LoginRoute.name, path: '/'),
        _i5.RouteConfig(UnderDevelopmentRoute.name, path: '/under-development'),
        _i5.RouteConfig(NotFoundRoute.name, path: '/not-found'),
        _i5.RouteConfig(HomeRoute.name, path: '/home-page', guards: [authGuard])
      ];
}

/// generated route for
/// [_i1.LoginPage]
class LoginRoute extends _i5.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i2.UnderDevelopmentPage]
class UnderDevelopmentRoute extends _i5.PageRouteInfo<void> {
  const UnderDevelopmentRoute()
      : super(UnderDevelopmentRoute.name, path: '/under-development');

  static const String name = 'UnderDevelopmentRoute';
}

/// generated route for
/// [_i3.NotFoundPage]
class NotFoundRoute extends _i5.PageRouteInfo<void> {
  const NotFoundRoute() : super(NotFoundRoute.name, path: '/not-found');

  static const String name = 'NotFoundRoute';
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home-page');

  static const String name = 'HomeRoute';
}
