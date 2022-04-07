import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:inventory_checker/core/themes/my_colors.dart';

class MyToasts {
  String messages;
  String status;
  Toast? length;
  ToastGravity? gravity;

  MyToasts({
    required this.messages,
    required this.status,
    this.length,
    this.gravity,
  });

  void show() {
    Color bgColor, textColor;
    switch (status) {
      case ('success'):
        bgColor = MyColors.success;
        textColor = MyColors.light;
        break;
      case ('error'):
        bgColor = MyColors.error;
        textColor = MyColors.light;
        break;
      case ('warning'):
        bgColor = MyColors.warning;
        textColor = MyColors.light;
        break;
      case ('info'):
        bgColor = MyColors.info;
        textColor = MyColors.light;
        break;
      case ('light'):
        bgColor = MyColors.light;
        textColor = MyColors.dark;
        break;
      case ('dark'):
        bgColor = MyColors.dark;
        textColor = MyColors.light;
        break;
      default:
        bgColor = MyColors.white;
        textColor = MyColors.dark;
    }

    Fluttertoast.showToast(
      msg: messages,
      toastLength: length ?? Toast.LENGTH_SHORT,
      gravity: gravity ?? ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: bgColor,
      textColor: textColor,
      fontSize: 16.0,
    );
  }
}
