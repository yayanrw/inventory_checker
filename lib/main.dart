import 'package:flutter/material.dart';
import 'package:inventory_checker/core/config/apps_config.dart';
import 'package:inventory_checker/core/routes/router.gr.dart';
import 'package:inventory_checker/core/themes/my_themes.dart';
import 'package:inventory_checker/features/login/presentation/provider/login_notifier.dart';
import 'package:provider/provider.dart';
import 'package:inventory_checker/injection.dart' as di;

void main() {
  di.init();
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget {
  AppWidget({Key? key}) : super(key: key);
  final _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => di.locator<LoginNotifier>()),
      ],
      child: MaterialApp.router(
        title: AppsConfig.appTitle,
        theme: myThemes(),
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
      ),
    );
  }
}
