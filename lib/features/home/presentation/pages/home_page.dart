import 'package:flutter/material.dart';
import 'package:inventory_checker/core/config/apps_config.dart';
import 'package:inventory_checker/core/widgets/card/my_card.dart';
import 'package:inventory_checker/features/home/domain/entities/home_menu.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppsConfig.appTitle),
        ),
        body: GridView.builder(
            padding: const EdgeInsets.all(AppsConfig.defaultPadding),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              return MyCard(
                title: myHomeMenu[index].title,
                imagePath: myHomeMenu[index].imagePath,
                onTap: myHomeMenu[index].onTap,
              );
            },
            itemCount: myHomeMenu.length),
      ),
    );
  }
}
