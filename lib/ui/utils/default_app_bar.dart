import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/constants/text_styles_app.dart';

/// Макет стандартного AppBar для большенства экранов приложения
/// title - заголовок
/// bottom - нижняя часть AppBar
/// action - кнопка слева
/// leading - кнопка справа
/// onTapAction - событие нажатия на кнопку слева
class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar({
    this.title,
    this.bottom,
    this.action,
    this.leading,
    this.leadingWidth,
    this.onTapAction,
    Key? key,
  }) : super(key: key);

  static const double _preferredSize = 60;
  static const double _preferredSizeBottom = 60;

  final String? title;
  final Widget? bottom;
  final Widget? leading;
  final double? leadingWidth;
  final Widget? action;
  final Function? onTapAction;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Theme.of(context).backgroundColor,
      elevation: 0,
      title: title != null
          ? Text(
              title!,
              style: TextStylesApp.size20Weight500.copyWith(
                color: Theme.of(context).textTheme.bodyText1!.color,
              ),
            )
          : null,
      bottom: bottom != null
          ? PreferredSize(
              preferredSize: const Size.fromHeight(_preferredSizeBottom),
              child: Container(
                alignment: Alignment.center,
                height: _preferredSizeBottom,
                child: bottom,
              ),
            )
          : null,
      actions: action != null
          ? [
              CupertinoButton(
                onPressed: onTapAction as void Function()?,
                child: action!,
              ),
            ]
          : [],
      leadingWidth: leadingWidth,
      leading: leading != null
          ? CupertinoButton(
              onPressed: () {},
              child: leading!,
            )
          : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
        _preferredSize + (bottom != null ? _preferredSizeBottom : 0),
      );
}
