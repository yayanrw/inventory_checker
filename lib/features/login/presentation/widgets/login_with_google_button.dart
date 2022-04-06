import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:inventory_checker/core/routes/router.gr.dart';
import 'package:inventory_checker/core/themes/my_colors.dart';
import 'package:inventory_checker/core/utils/my_strings.dart';
import 'package:inventory_checker/core/widgets/button/my_button.dart';

Widget loginWithGoogleButton(BuildContext context) {
  return MyButton(
    buttonColor: MyColors.bgWhiteSmooth,
    textValue: MyStrings.loginWithGoogle,
    textColor: Colors.black,
    onPressed: () => context.router.push(const UnderDevelopmentRoute()),
  );
}
