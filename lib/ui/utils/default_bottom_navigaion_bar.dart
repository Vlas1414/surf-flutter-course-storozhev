import 'package:flutter/material.dart';
import 'package:places/constants/assetsApp.dart';
import 'package:places/constants/colorsApp.dart';

/// Нижняя навигация меню
class DefaultBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Theme.of(context).backgroundColor,
      selectedItemColor: ColorsApp.secondary,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(
          label: "",
          icon: Image.asset(
            AssetsApp.listIcon,
            color: Theme.of(context).textTheme.bodyText1!.color,
            width: 25,
          ),
        ),
        BottomNavigationBarItem(
          label: "",
          icon: Image.asset(
            AssetsApp.heartIcon,
            color: Theme.of(context).textTheme.bodyText1!.color,
            width: 25,
          ),
        ),
        BottomNavigationBarItem(
          label: "",
          icon: Image.asset(
            AssetsApp.settingsFullIcon,
            color: Theme.of(context).textTheme.bodyText1!.color,
            width: 25,
          ),
        ),
      ],
    );
  }
}
