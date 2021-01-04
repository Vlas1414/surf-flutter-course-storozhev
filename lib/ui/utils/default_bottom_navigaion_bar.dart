import 'package:flutter/material.dart';
import 'package:places/constants/assetsApp.dart';
import 'package:places/constants/colorsApp.dart';

/// Нижняя навигация меню
Widget defaultBottomNavigationBar() {
  return BottomNavigationBar(
    backgroundColor: ColorsApp.white,
    selectedItemColor: ColorsApp.secondary,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    items: [
      BottomNavigationBarItem(
        label: "",
        icon: Image.asset(
          AssetsApp.listIcon,
          color: ColorsApp.secondary,
          width: 25,
        ),
      ),
      BottomNavigationBarItem(
        label: "",
        icon: Image.asset(
          AssetsApp.heartFullIcon,
          color: ColorsApp.secondary,
          width: 25,
        ),
      ),
    ],
  );
}
