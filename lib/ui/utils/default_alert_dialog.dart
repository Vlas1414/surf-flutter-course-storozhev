import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/constants/colors_app.dart';
import 'package:places/constants/strings_app.dart';
import 'package:places/constants/text_styles_app.dart';

/// Макет стандартного диалога для большенства экранов приложения
/// content - текст диалога
class DefaultAlertDialog extends StatelessWidget {
  const DefaultAlertDialog({this.content, Key? key}) : super(key: key);

  final Widget? content;

  Future<bool?> showAlertDialog(BuildContext context) async {
    return showDialog<bool>(
      context: context,
      builder: (_) => this,
    );
  }

  Widget alertBtn(String text, Function() onPressed) {
    return TextButton(
      style: TextButton.styleFrom(
        primary: ColorsApp.green,
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStylesApp.size14,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: content,
      contentPadding: const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 0),
      actions: [
        alertBtn(
          StringsApp.no,
          () => Navigator.pop(context, false),
        ),
        alertBtn(
          StringsApp.yes,
          () => Navigator.pop(context, true),
        ),
      ],
    );
  }
}
