import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/constants/textStylesApp.dart';

/// Макет стандартного AppBar для большенства экранов приложения
/// title - заголовок
/// bottom - нижняя часть AppBar
class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  DefaultAppBar({
    this.title,
    this.bottom,
    this.action,
    this.leading,
    this.onTapAction,
  });

  final double _preferredSize = 60;
  final double _preferredSizeBottom = 60;

  final String title;
  final Widget bottom;
  final Widget leading;
  final Widget action;
  final Function onTapAction;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Theme.of(context).backgroundColor,
      elevation: 0,
      title: title != null
          ? Text(
              title,
              style: TextStylesApp.size20Weight500.copyWith(
                color: Theme.of(context).textTheme.bodyText1.color,
              ),
            )
          : null,
      bottom: bottom != null
          ? PreferredSize(
              child: Container(
                alignment: Alignment.center,
                height: _preferredSizeBottom,
                child: bottom,
              ),
              preferredSize: Size.fromHeight(_preferredSizeBottom),
            )
          : null,
      actions: action != null
          ? [
              CupertinoButton(
                onPressed: onTapAction,
                child: action,
              ),
            ]
          : [],
      leading: leading != null
          ? CupertinoButton(
              onPressed: () {},
              child: leading,
            )
          : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
        _preferredSize + (bottom != null ? _preferredSizeBottom : 0),
      );
}
