import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inventory_checker/core/themes/my_colors.dart';
import 'package:inventory_checker/core/themes/my_texts.dart';
import 'package:inventory_checker/core/utils/my_strings.dart';
import 'package:inventory_checker/core/widgets/button/my_button.dart';

class UnderDevelopmentPage extends StatelessWidget {
  const UnderDevelopmentPage({Key? key}) : super(key: key);

  static const routeName = '/under_development';

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
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: SvgPicture.asset(
                  'assets/images/under_development.svg',
                  height: 400,
                  width: 250,
                ),
              ),
              Text(
                MyStrings.underDevelopment,
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
