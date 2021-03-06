import 'package:flutter/material.dart';
import 'package:places/constants/colors_app.dart';

/// светлая тема для приложения
final lightTheme = ThemeData(
  appBarTheme: const AppBarTheme(brightness: Brightness.dark),
  backgroundColor: ColorsApp.white,
  scaffoldBackgroundColor: ColorsApp.white,
  primaryColor: ColorsApp.background,
  selectedRowColor: ColorsApp.secondary,
  textTheme: const TextTheme(
    bodyText1: TextStyle(color: ColorsApp.main),
    headline1: TextStyle(
      color: ColorsApp.secondary,
    ),
    headline2: TextStyle(
      color: ColorsApp.secondary,
    ),
    headline3: TextStyle(
      color: ColorsApp.secondary2,
    ),
    headline4: TextStyle(
      color: ColorsApp.inactiveBlack,
    ),
    headline5: TextStyle(
      color: ColorsApp.white,
    ),
  ),
);

/// темная тема для приложения
final darkTheme = ThemeData(
  appBarTheme: const AppBarTheme(brightness: Brightness.dark),
  backgroundColor: ColorsApp.dmMain,
  scaffoldBackgroundColor: ColorsApp.dmMain,
  primaryColor: ColorsApp.dark,
  selectedRowColor: ColorsApp.background,
  textTheme: const TextTheme(
    bodyText1: TextStyle(color: ColorsApp.white),
    headline1: TextStyle(
      color: ColorsApp.white,
    ),
    headline2: TextStyle(
      color: ColorsApp.secondary2,
    ),
    headline3: TextStyle(
      color: ColorsApp.inactiveBlack,
    ),
    headline4: TextStyle(
      color: ColorsApp.secondary2,
    ),
    headline5: TextStyle(
      color: ColorsApp.secondary,
    ),
  ),
);
