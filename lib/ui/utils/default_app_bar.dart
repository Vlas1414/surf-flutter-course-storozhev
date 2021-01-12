import 'package:flutter/material.dart';
import 'package:places/constants/textStylesApp.dart';

/// Макет стандартного AppBar для большенства экранов приложения
/// title - заголовок
/// bottom - нижняя часть AppBar
Widget defaultAppBar({context, title, bottom}) {
  const double _preferredSize = 60;

  return AppBar(
    centerTitle: true,
    backgroundColor: Theme.of(context).backgroundColor,
    elevation: 0,
    title: Text(
      title,
      style: TextStylesApp.size20Weight500.copyWith(
        color: Theme.of(context).textTheme.bodyText1.color,
      ),
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
