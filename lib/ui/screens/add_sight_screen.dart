import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/constants/assets_app.dart';
import 'package:places/constants/colors_app.dart';
import 'package:places/constants/strings_app.dart';
import 'package:places/constants/text_styles_app.dart';
import 'package:places/ui/utils/default_accept_button.dart';
import 'package:places/ui/utils/default_app_bar.dart';
import 'package:places/ui/utils/default_text_input.dart';

class AddSightScreen extends StatelessWidget {
  const AddSightScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: StringsApp.addSightTitle,
        leading: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            StringsApp.cancel,
            style: TextStylesApp.size16Weight500.copyWith(
              color: ColorsApp.secondary2,
            ),
          ),
        ),
        leadingWidth: double.infinity,
      ),
      body: Column(
        children: const [
          Expanded(child: _Content()),
          Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: DefaultAcceptButton(
              text: StringsApp.create,
            ),
          ),
        ],
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categorySelectInput = InkWell(
      borderRadius: const BorderRadius.all(
        Radius.circular(10),
      ),
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Text(
              StringsApp.addSightCategoryNotSelected,
              style: TextStylesApp.size16.copyWith(
                color: ColorsApp.secondary2,
              ),
            ),
            const Spacer(),
            Transform(
              transform: Matrix4.rotationY(math.pi),
              alignment: FractionalOffset.center,
              child: Image.asset(
                AssetsApp.arrowIcon,
                width: 24,
                height: 24,
                color: Theme.of(context).textTheme.bodyText1!.color,
              ),
            ),
            const SizedBox(width: 10)
          ],
        ),
      ),
    );
    Widget buildRow(
      String text,
      Widget child, {
      double spaceBetweenElements = 12,
    }) {
      return SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Text(
              text.toUpperCase(),
              style: TextStylesApp.size12.copyWith(
                color: ColorsApp.inactiveBlack,
              ),
            ),
            SizedBox(height: spaceBetweenElements),
            child,
          ],
        ),
      );
    }

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const SizedBox(height: 8),
        Container(
          height: 72,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            color: ColorsApp.inactiveBlack,
          ),
        ),
        buildRow(
          StringsApp.addSightCategory,
          categorySelectInput,
          spaceBetweenElements: 6,
        ),
        const SizedBox(height: 6),
        const Divider(height: 0),
        buildRow(
          StringsApp.addSightName,
          const DefaultTextInput(
            textInputAction: TextInputAction.go,
            hintText: StringsApp.addSightName,
            maxLength: 60,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: buildRow(
                StringsApp.addSightLat,
                const DefaultTextInput(
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.go,
                  hintText: StringsApp.addSightLat,
                  maxLength: 15,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: buildRow(
                StringsApp.addSightLon,
                const DefaultTextInput(
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.go,
                  hintText: StringsApp.addSightLon,
                  maxLength: 15,
                ),
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            child: Text(
              StringsApp.addSightSetOnMap,
              style: TextStylesApp.size16Weight500.copyWith(
                color: ColorsApp.green,
              ),
            ),
          ),
        ),
        buildRow(
          StringsApp.addSightDesc,
          const DefaultTextInput(
            maxLines: 3,
            maxLength: 1000,
          ),
        ),
      ],
    );
  }
}
