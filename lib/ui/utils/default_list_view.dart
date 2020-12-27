import 'package:flutter/material.dart';
import 'package:places/constants/assetsConstant.dart';
import 'package:places/constants/colorsConstant.dart';
import 'package:places/constants/stringsConstant.dart';
import 'package:places/constants/textStylesConstant.dart';

/// Макет стандартного отображения списка для большенства экранов приложения
/// children - список элементов
/// imageSrcEmptyArray - картинка если нет элементов
/// textEmptyArray - текст если нет элементов
class DefaultListView extends StatelessWidget {
  final List<Widget> children;
  final String imageSrcEmptyArray;
  final String textEmptyArray;

  DefaultListView(
      {this.children, this.imageSrcEmptyArray, this.textEmptyArray});
  DefaultListView.futureVisite(List<Widget> children)
      : this(
          children: children,
          imageSrcEmptyArray: AssetsConstant.empty,
          textEmptyArray: StringsConstant.visitingTabEmptyTextFuture,
        );
  DefaultListView.pastVisite(List<Widget> children)
      : this(
          children: children,
          imageSrcEmptyArray: AssetsConstant.goIcon,
          textEmptyArray: StringsConstant.visitingTabEmptyTextPast,
        );
  DefaultListView.simpleList(List<Widget> children)
      : this(
          children: children,
          imageSrcEmptyArray: AssetsConstant.geolocationIcon,
          textEmptyArray: StringsConstant.simpleListEmptyText,
        );

  @override
  Widget build(BuildContext context) {
    if (this.children.length == 0) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        color: ColorsConstant.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              imageSrcEmptyArray,
              width: 65,
              color: ColorsConstant.inactiveBlack,
            ),
            const SizedBox(height: 25),
            Text(
              StringsConstant.visitingTabEmptyText,
              style: TextStylesConstant.visitingTabEmptyText.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 15),
            Container(
              width: 190,
              child: Text(
                textEmptyArray,
                style: TextStylesConstant.visitingTabEmptyText,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      color: ColorsConstant.white,
      padding: const EdgeInsets.only(top: 5),
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 15),
        child: Column(
          children: this.children,
        ),
      ),
    );
  }
}
