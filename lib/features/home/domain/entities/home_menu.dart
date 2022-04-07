import 'package:flutter/material.dart';

class HomeMenu {
  String title;
  String imagePath;
  VoidCallback onTap;

  HomeMenu({required this.title, required this.imagePath, required this.onTap});
}

List<HomeMenu> myHomeMenu = [
  HomeMenu(title: 'Check QR', imagePath: 'assets/images/404.svg', onTap: () {}),
  HomeMenu(title: 'Scan OUT', imagePath: 'assets/images/404.svg', onTap: () {}),
];
