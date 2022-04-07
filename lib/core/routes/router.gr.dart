// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;

import '../../features/check_qr/presentation/pages/check_qr_page.dart' as _i5;
import '../../features/home/presentation/pages/home_page.dart' as _i4;
import '../../features/login/presentation/pages/login_page.dart' as _i1;
import '../../features/others/presentation/pages/not_found_page.dart' as _i3;
import '../../features/others/presentation/pages/under_development_page.dart'
    as _i2;
import '../../features/scan_out/presentation/pages/scan_out_page.dart' as _i6;
import 'auth_guard.dart' as _i9;

class AppRouter extends _i7.RootStackRouter {
  AppRouter(
      {_i8.GlobalKey<_i8.NavigatorState>? navigatorKey,
      required this.authGuard})
      : super(navigatorKey);

  final _i9.AuthGuard authGuard;

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.LoginPage());
    },
    UnderDevelopmentRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.UnderDevelopmentPage());
    },
    NotFoundRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.NotFoundPage());
    },
    HomeRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.HomePage());
    },
    CheckQrRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.CheckQrPage());
    },
    ScanOutRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.ScanOutPage());
    }
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(LoginRoute.name, path: '/'),
        _i7.RouteConfig(UnderDevelopmentRoute.name, path: '/under-development'),
        _i7.RouteConfig(NotFoundRoute.name, path: '/not-found'),
        _i7.RouteConfig(HomeRoute.name,
            path: '/home-page', guards: [authGuard]),
        _i7.RouteConfig(CheckQrRoute.name,
            path: '/check-qr-page', guards: [authGuard]),
        _i7.RouteConfig(ScanOutRoute.name,
            path: '/scan-out-page', guards: [authGuard])
      ];
}

/// generated route for
/// [_i1.LoginPage]
class LoginRoute extends _i7.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i2.UnderDevelopmentPage]
class UnderDevelopmentRoute extends _i7.PageRouteInfo<void> {
  const UnderDevelopmentRoute()
      : super(UnderDevelopmentRoute.name, path: '/under-development');

  static const String name = 'UnderDevelopmentRoute';
}

/// generated route for
/// [_i3.NotFoundPage]
class NotFoundRoute extends _i7.PageRouteInfo<void> {
  const NotFoundRoute() : super(NotFoundRoute.name, path: '/not-found');

  static const String name = 'NotFoundRoute';
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home-page');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i5.CheckQrPage]
class CheckQrRoute extends _i7.PageRouteInfo<void> {
  const CheckQrRoute() : super(CheckQrRoute.name, path: '/check-qr-page');

  static const String name = 'CheckQrRoute';
}

/// generated route for
/// [_i6.ScanOutPage]
class ScanOutRoute extends _i7.PageRouteInfo<void> {
  const ScanOutRoute() : super(ScanOutRoute.name, path: '/scan-out-page');

  static const String name = 'ScanOutRoute';
}
