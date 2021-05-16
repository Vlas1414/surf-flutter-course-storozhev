import 'package:flutter/material.dart';
import 'package:places/constants/colors_app.dart';
import 'package:places/constants/text_styles_app.dart';

class ActionRow extends StatelessWidget {
  const ActionRow({
    required this.text,
    this.color,
    this.action,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final String text;
  final Color? color;
  final Widget? action;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: onTap,
          child: SizedBox(
            height: 45,
            child: Row(
              children: [
                Text(
                  text,
                  style: TextStylesApp.size16.copyWith(
                    color:
                        color ?? Theme.of(context).textTheme.bodyText1!.color,
                  ),
                ),
                if (action != null) ...[
                  const Spacer(),
                  action!,
                ],
              ],
            ),
          ),
        ),
        const Divider(
          color: ColorsApp.inactiveBlack,
          height: 9,
        ),
      ],
    );
  }
}
