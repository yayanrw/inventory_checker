import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:inventory_checker/core/config/apps_config.dart';
import 'package:inventory_checker/core/themes/my_colors.dart';
import 'package:inventory_checker/core/themes/my_texts.dart';
import 'package:inventory_checker/core/utils/my_strings.dart';

InputDecoration emailInputDecoration() {
  return InputDecoration(
    filled: true,
    fillColor: MyColors.textWhiteGrey,
    floatingLabelBehavior: FloatingLabelBehavior.never,
    prefixIcon: Padding(
      padding: const EdgeInsets.all(6),
      child: Container(
        height: 10,
        width: 10,
        decoration: BoxDecoration(
            color: MyColors.primarySmooth,
            borderRadius: BorderRadius.circular(AppsConfig.defaultRadius)),
        child: Icon(
          IconlyBold.message,
          color: MyColors.primary,
        ),
      ),
    ),
    contentPadding: const EdgeInsets.symmetric(
        vertical: AppsConfig.defaultPadding,
        horizontal: AppsConfig.defaultPadding * 2),
    hintText: MyStrings.emailDummy,
    labelText: MyStrings.email,
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(AppsConfig.defaultRadius),
    ),
  );
}

InputDecoration passwordInputDecoration(
    bool _passwordVisible, VoidCallback _togglePasswordVisibility) {
  return InputDecoration(
    filled: true,
    fillColor: MyColors.textWhiteGrey,
    floatingLabelBehavior: FloatingLabelBehavior.never,
    prefixIcon: Padding(
      padding: const EdgeInsets.all(6),
      child: Container(
        height: 10,
        width: 10,
        decoration: BoxDecoration(
            color: MyColors.primarySmooth,
            borderRadius: BorderRadius.circular(AppsConfig.defaultRadius)),
        child: Icon(
          IconlyBold.lock,
          color: MyColors.primary,
        ),
      ),
    ),
    contentPadding: const EdgeInsets.symmetric(
        vertical: AppsConfig.defaultPadding,
        horizontal: AppsConfig.defaultPadding * 2),
    hintText: MyStrings.passwordDummy,
    labelText: MyStrings.password,
    suffixIcon: IconButton(
      color: MyColors.textGrey,
      padding: const EdgeInsets.only(right: AppsConfig.defaultPadding * 2),
      splashRadius: 1,
      icon: Icon(_passwordVisible
          ? Icons.visibility_outlined
          : Icons.visibility_off_outlined),
      onPressed: _togglePasswordVisibility,
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(AppsConfig.defaultRadius),
    ),
  );
}

InputDecoration searchInputDecoration() {
  return InputDecoration(
    filled: true,
    fillColor: MyColors.white,
    contentPadding: const EdgeInsets.all(AppsConfig.defaultPadding),
    hintStyle: myTexts(color: MyColors.textGrey).bodyText1,
    hintText: MyStrings.searchProducts,
    prefixIcon: Padding(
      padding: const EdgeInsets.only(
          left: AppsConfig.defaultPadding,
          right: AppsConfig.defaultPadding / 2),
      child: Icon(Icons.search, color: MyColors.primary),
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(AppsConfig.defaultRadius),
    ),
  );
}
