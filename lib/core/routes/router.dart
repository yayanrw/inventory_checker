import 'package:auto_route/auto_route.dart';
import 'package:inventory_checker/features/home/presentation/pages/home_page.dart';
import 'package:inventory_checker/features/login/presentation/pages/login_page.dart';
import 'package:inventory_checker/features/others/presentation/pages/not_found_page.dart';
import 'package:inventory_checker/features/others/presentation/pages/under_development_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      initial: true,
      path: '/',
      page: LoginPage,
    ),
    AutoRoute(
      path: '/under-development',
      page: UnderDevelopmentPage,
    ),
    AutoRoute(
      path: '/not-found',
      page: NotFoundPage,
    ),
    AutoRoute(path: '/my-layout', page: HomePage, children: []),
  ],
)
class $AppRouter {}
