import 'package:flutter/material.dart';
import 'package:inventory_checker/core/config/apps_config.dart';
import 'package:inventory_checker/core/themes/my_colors.dart';
import 'package:inventory_checker/core/themes/my_texts.dart';

class MyButton extends StatelessWidget {
  final Color? buttonColor;
  final Color? textColor;
  final String textValue;
  final VoidCallback onPressed;

  const MyButton(
      {Key? key,
      this.buttonColor,
      this.textColor,
      required this.textValue,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(AppsConfig.defaultRadius),
      elevation: 0,
      child: Container(
        decoration: BoxDecoration(
          color: buttonColor ?? MyColors.primary,
          borderRadius: BorderRadius.circular(AppsConfig.defaultRadius),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => onPressed(),
            borderRadius: BorderRadius.circular(AppsConfig.defaultRadius),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(AppsConfig.defaultPadding),
                child: Text(
                  textValue,
                  style: myTexts(color: textColor ?? MyColors.white).headline5,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
