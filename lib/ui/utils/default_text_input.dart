import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:places/constants/assets_app.dart';
import 'package:places/constants/colors_app.dart';
import 'package:places/constants/text_styles_app.dart';

/// Макет поля для ввода
/// maxLines - максимальное количество строк,
/// если maxlines > 1, применяються стандартные отступы
///
/// keyboardType - тип виртуальной клавиатуры
class DefaultTextInput extends StatefulWidget {
  const DefaultTextInput({
    Key? key,
    this.controller,
    this.maxLines = 1,
    this.maxLength,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.hintText = 'Введите текст...',
    this.autovalidateMode,
    this.validatorRegex,
    this.validatorErrorMessage,
    this.fillColor,
    this.border,
    this.prefixIcon,
    this.suffixIcon,
    this.readOnly = false,
    this.onTap,
    this.autofocus = false,
  }) : super(key: key);

  final TextEditingController? controller;
  final int maxLines;
  final int? maxLength;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final String hintText;
  final AutovalidateMode? autovalidateMode;
  final String? validatorRegex;
  final String? validatorErrorMessage;
  final Color? fillColor;
  final InputBorder? border;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool readOnly;
  final Function()? onTap;
  final bool autofocus;

  @override
  _DefaultTextInputState createState() => _DefaultTextInputState();
}

class _DefaultTextInputState extends State<DefaultTextInput> {
  final textFieldFocusNode = FocusNode();
  late TextEditingController controller;

  @override
  void initState() {
    controller = widget.controller ?? TextEditingController();

    textFieldFocusNode.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final inputBorder = widget.border ??
        OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorsApp.green.withOpacity(0.4),
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
        );

    final clearButton = SizedBox(
      height: 40,
      child: CupertinoButton(
        padding: const EdgeInsets.all(0),
        onPressed: () {
          if (controller.value.text.isEmpty) {
            textFieldFocusNode.unfocus();
          }
          controller.clear();
        },
        child: Image.asset(
          AssetsApp.clearIcon,
          height: 23,
          width: 23,
          color: Theme.of(context).textTheme.bodyText1!.color,
        ),
      ),
    );

    return TextFormField(
      autofocus: widget.autofocus,
      onTap: widget.onTap,
      readOnly: widget.readOnly,
      autovalidateMode: widget.autovalidateMode,
      validator: (value) {
        if (value != null &&
            widget.validatorRegex != null &&
            widget.validatorErrorMessage != null) {
          final RegExp regex = RegExp(widget.validatorRegex!);
          final bool isValid = regex.hasMatch(value);
          if (!isValid) {
            return widget.validatorErrorMessage;
          }
        }

        return null;
      },
      focusNode: widget.readOnly ? null : textFieldFocusNode,
      controller: controller,
      onEditingComplete: textFieldFocusNode.nextFocus,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      maxLines: widget.maxLines,
      cursorWidth: 1,
      cursorColor: Theme.of(context).textTheme.bodyText1!.color,
      textCapitalization: TextCapitalization.sentences,
      maxLength: widget.maxLength,
      style: TextStylesApp.size16.copyWith(
        color: Theme.of(context).textTheme.bodyText1!.color,
        height: 1.4,
      ),
      decoration: InputDecoration(
        counterText: '',
        filled: widget.fillColor != null,
        fillColor: widget.fillColor,
        hintText: widget.hintText,
        hintStyle: TextStylesApp.size16.copyWith(
          color: ColorsApp.inactiveBlack,
          height: 1.4,
        ),
        isDense: true,
        border: inputBorder,
        enabledBorder: inputBorder,
        focusedBorder: inputBorder.copyWith(
          borderSide: inputBorder.borderSide.copyWith(
            width: 2,
          ),
        ),
        prefixIcon: widget.prefixIcon,
        prefixIconConstraints: const BoxConstraints(),
        suffixIcon: textFieldFocusNode.hasFocus && widget.maxLines == 1
            ? clearButton
            : widget.suffixIcon,
        suffixIconConstraints: const BoxConstraints(),
        contentPadding: EdgeInsets.only(
          left: 16,
          right: textFieldFocusNode.hasFocus && widget.maxLines == 1 ? 0 : 16,
          top: 10,
          bottom: 10,
        ),
      ),
    );
  }
}
