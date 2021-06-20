import 'package:flutter/material.dart';
import 'package:places/constants/colors_app.dart';
import 'package:places/constants/text_styles_app.dart';

class ActionRow extends StatelessWidget {
  const ActionRow({
    required this.text,
    this.color,
    this.action,
    this.onTap,
    this.isShowBottomLine = true,
    Key? key,
  }) : super(key: key);

  final String text;
  final Color? color;
  final Widget? action;
  final Function()? onTap;
  final bool isShowBottomLine;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    text,
                    style: TextStylesApp.size16.copyWith(
                      color:
                          color ?? Theme.of(context).textTheme.bodyText1!.color,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (action != null) ...[
                  action!,
                ],
              ],
            ),
          ),
        ),
        if (isShowBottomLine)
          const Divider(
            color: ColorsApp.inactiveBlack,
            height: 9,
          ),
      ],
    );
  }
}
