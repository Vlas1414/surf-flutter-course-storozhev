import 'package:flutter/material.dart';
import 'package:places/constants/colorsApp.dart';
import 'package:places/constants/textStylesApp.dart';

class DefaultAcceptButton extends StatelessWidget {
  final String? text;
  final String? icon;

  DefaultAcceptButton({this.text, this.icon})
      : assert(text != null || icon != null);

  @override
  Widget build(BuildContext context) {
    Text? textWidget = text != null
        ? Text(
            text!.toUpperCase(),
            style: TextStylesApp.size14WeightBold.copyWith(
              color: ColorsApp.white,
            ),
          )
        : null;
    Image? iconWidget = icon != null
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
      onPressed: () => print('Tap big green button'),
      style: TextButton.styleFrom(
        primary: Theme.of(context).textTheme.headline1!.color,
        minimumSize: const Size.fromHeight(55),
        shape: const RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        backgroundColor: ColorsApp.green,
      ),
      child: content!,
    );
  }
}
