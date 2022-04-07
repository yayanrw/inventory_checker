import 'package:auto_route/auto_route.dart';
import 'package:inventory_checker/core/routes/router.gr.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  Future<void> onNavigation(
      NavigationResolver resolver, StackRouter router) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getString('auth') != null) {
      resolver.next(true);
    } else {
      router.replace(const LoginRoute());
    }
  }
}
