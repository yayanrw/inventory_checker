import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inventory_checker/core/config/apps_config.dart';
import 'package:inventory_checker/core/themes/my_texts.dart';

class MyCard extends StatelessWidget {
  const MyCard(
      {Key? key,
      required this.title,
      required this.imagePath,
      required this.pathName})
      : super(key: key);

  final String title;
  final String imagePath;
  final String pathName;

  @override
  Widget build(BuildContext context) {
    // create flutter card widget with image and text
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppsConfig.defaultRadius),
      ),
      child: InkWell(
        onTap: () => context.router.pushNamed(pathName),
        borderRadius: BorderRadius.circular(AppsConfig.defaultRadius),
        child: Padding(
          padding: const EdgeInsets.all(AppsConfig.defaultPadding * 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SvgPicture.asset(
                imagePath,
                height: 110,
              ),
              const SizedBox(
                height: AppsConfig.defaultPadding,
              ),
              Text(title, style: myTexts().bodyText1),
            ],
          ),
        ),
      ),
    );
  }
}
