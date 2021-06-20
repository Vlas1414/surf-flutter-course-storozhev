import 'package:flutter/material.dart';
import 'package:places/constants/colors_app.dart';
import 'package:places/constants/text_styles_app.dart';

/// Макет стандартной кнопки принятия для большенства экранов приложения
/// text - текст кнопки
/// icon - иконка кнопки
/// onPressed - обратный вызов действия по нажатию на кнопку
class DefaultAcceptButton extends StatelessWidget {
  const DefaultAcceptButton({
    this.text,
    this.icon,
    this.onPressed,
    Key? key,
  })  : assert(text != null || icon != null),
        super(key: key);

  final String? text;
  final String? icon;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final Text? textWidget = text != null
        ? Text(
            text!.toUpperCase(),
            style: TextStylesApp.size14WeightBold.copyWith(
              color: ColorsApp.white,
            ),
          )
        : null;
    final Image? iconWidget = icon != null
        ? Image.asset(
            icon!,
            width: 25,
            height: 25,
          )
        : null;

    Widget? content;
    if (textWidget != null && iconWidget != null) {
      content = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          iconWidget,
          const SizedBox(width: 10),
          textWidget,
        ],
      );
    } else {
      content = textWidget ?? iconWidget;
    }

    return TextButton(
      // ignore: avoid_print
      onPressed: onPressed ?? () => print('Tap big green button'),
      style: TextButton.styleFrom(
        primary: Theme.of(context).textTheme.headline1!.color,
        minimumSize: const Size.fromHeight(55),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        backgroundColor: ColorsApp.green,
      ),
      child: content!,
    );
  }
}
