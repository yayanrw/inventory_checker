import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:inventory_checker/core/config/apps_config.dart';
import 'package:inventory_checker/core/routes/router.gr.dart';
import 'package:inventory_checker/core/themes/my_themes.dart';
import 'package:inventory_checker/features/check_qr/presentation/provider/check_qr_notifier.dart';
import 'package:inventory_checker/features/login/presentation/provider/login_notifier.dart';
import 'package:provider/provider.dart';
import 'package:inventory_checker/injection.dart' as di;

import 'core/routes/auth_guard.dart';

void main() {
  di.init();
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget {
  AppWidget({Key? key}) : super(key: key);
  final _appRouter = AppRouter(authGuard: AuthGuard());

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => di.locator<LoginNotifier>()),
        ChangeNotifierProvider(create: (ctx) => di.locator<CheckQrNotifier>()),
      ],
      child: MaterialApp.router(
        title: AppsConfig.appTitle,
        theme: myThemes(),
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        builder: EasyLoading.init(),
      ),
    );
  }
}
