import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:inventory_checker/core/routes/router.gr.dart';
import 'package:inventory_checker/core/widgets/button/my_button.dart';
import 'package:inventory_checker/features/login/presentation/provider/login_notifier.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyButton(
              textValue: 'Under Development Page',
              onPressed: () =>
                  context.router.push(const UnderDevelopmentRoute()),
            ),
            MyButton(
              textValue: 'Logout',
              onPressed: () async {
                await Provider.of<LoginNotifier>(context, listen: false)
                    .logOut();
                context.replaceRoute(const LoginRoute());
              },
            ),
          ],
        )),
      ),
    );
  }
}
