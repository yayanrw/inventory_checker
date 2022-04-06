import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inventory_checker/core/themes/my_colors.dart';
import 'package:inventory_checker/core/themes/my_texts.dart';
import 'package:inventory_checker/core/utils/my_strings.dart';
import 'package:inventory_checker/core/widgets/button/my_button.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  static const routeName = '/not_found';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 48),
                child: SvgPicture.asset(
                  'assets/images/404.svg',
                  height: 350,
                  width: 200,
                ),
              ),
              Text(
                MyStrings.notFound,
                style: myTexts(color: MyColors.textBlack).headline5,
              ),
              const SizedBox(
                height: 48,
              ),
              MyButton(
                  buttonColor: MyColors.primary,
                  textColor: Colors.white,
                  textValue: MyStrings.goBack,
                  onPressed: () => Navigator.pop(context))
            ],
          ),
        ),
      ),
    );
  }
}
