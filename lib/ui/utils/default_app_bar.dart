import 'package:flutter/material.dart';
import 'package:places/constants/colorsConstant.dart';
import 'package:places/constants/textStylesConstant.dart';

/// Макет стандартного AppBar для большенства экранов приложения
/// title - заголовок
/// bottom - нижняя часть AppBar
Widget defaultAppBar({title, bottom}) {
  const double _preferredSize = 60;

  return AppBar(
    centerTitle: true,
    backgroundColor: ColorsConstant.white,
    elevation: 0,
    title: Text(
      title,
      style: TextStylesConstant.appdDefaultTitle,
    ),
    bottom: PreferredSize(
      child: Container(
        alignment: Alignment.center,
        height: _preferredSize,
        child: bottom,
      ),
      preferredSize: Size.fromHeight(_preferredSize),
    ),
  );
}
