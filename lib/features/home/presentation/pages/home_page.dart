import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:inventory_checker/core/config/apps_config.dart';
import 'package:inventory_checker/core/routes/router.gr.dart';
import 'package:inventory_checker/core/themes/my_colors.dart';
import 'package:inventory_checker/core/utils/my_strings.dart';
import 'package:inventory_checker/core/widgets/card/my_card.dart';
import 'package:inventory_checker/features/home/domain/entities/home_menu.dart';
import 'package:inventory_checker/features/login/presentation/provider/login_notifier.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppsConfig.appTitle),
          actions: [
            PopupMenuButton(
              icon: Icon(
                Icons.more_vert,
                color: MyColors.light,
              ),
              onSelected: (item) {
                Provider.of<LoginNotifier>(context, listen: false).logOut();
                context.router.replace(const LoginRoute());
              },
              itemBuilder: (context) => [
                const PopupMenuItem<int>(value: 0, child: Text(MyStrings.logOut)),
              ],
            ),
          ],
        ),
        body: GridView.builder(
            padding: const EdgeInsets.all(AppsConfig.defaultPadding),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              return MyCard(
                title: myHomeMenu[index].title,
                imagePath: myHomeMenu[index].imagePath,
                pathName: myHomeMenu[index].pathName,
              );
            },
            itemCount: myHomeMenu.length),
      ),
    );
  }
}
