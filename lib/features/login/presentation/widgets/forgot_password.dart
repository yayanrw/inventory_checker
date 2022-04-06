import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:inventory_checker/core/routes/router.gr.dart';
import 'package:inventory_checker/core/themes/my_colors.dart';
import 'package:inventory_checker/core/themes/my_texts.dart';
import 'package:inventory_checker/core/utils/my_strings.dart';

Widget forgotPassword(BuildContext context) {
  return TextButton(
      onPressed: () => context.router.push(const UnderDevelopmentRoute()),
      child: Text(MyStrings.forgotPassword,
          style: myTexts(color: MyColors.primary).bodyText1));
}
