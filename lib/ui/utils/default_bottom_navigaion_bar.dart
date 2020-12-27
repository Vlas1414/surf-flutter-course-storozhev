import 'package:flutter/material.dart';
import 'package:places/constants/assetsConstant.dart';
import 'package:places/constants/colorsConstant.dart';

/// Нижняя навигация меню
Widget defaultBottomNavigationBar() {
  return BottomNavigationBar(
    backgroundColor: ColorsConstant.white,
    selectedItemColor: ColorsConstant.secondary,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    items: [
      BottomNavigationBarItem(
        label: "",
        icon: Image.asset(
          AssetsConstant.listIcon,
          color: ColorsConstant.secondary,
          width: 25,
        ),
      ),
      BottomNavigationBarItem(
        label: "",
        icon: Image.asset(
          AssetsConstant.heartFullIcon,
          color: ColorsConstant.secondary,
          width: 25,
        ),
      ),
    ],
  );
}
