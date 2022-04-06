import 'package:flutter/material.dart';
import 'package:inventory_checker/core/themes/my_colors.dart';
import 'package:inventory_checker/core/themes/my_texts.dart';
import 'package:inventory_checker/core/utils/my_strings.dart';

Widget orText() {
  return Center(
    child: Text(
      MyStrings.or,
      style: myTexts(color: MyColors.textGrey).bodyText1,
    ),
  );
}
