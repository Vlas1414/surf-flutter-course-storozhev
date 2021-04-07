import 'package:flutter/material.dart';
import 'package:places/constants/assetsApp.dart';
import 'package:places/constants/colorsApp.dart';
import 'package:places/constants/stringsApp.dart';
import 'package:places/constants/textStylesApp.dart';

/// Макет стандартного отображения списка для большенства экранов приложения
/// children - список элементов
/// imageSrcEmptyArray - картинка если нет элементов
/// textEmptyArray - текст если нет элементов
class DefaultListView extends StatelessWidget {
  final List<Widget> children;
  final String imageSrcEmptyArray;
  final String textEmptyArray;

  DefaultListView({
    this.children,
    this.imageSrcEmptyArray,
    this.textEmptyArray,
  });

  DefaultListView.futureVisite(List<Widget> children)
      : this(
          children: children,
          imageSrcEmptyArray: AssetsApp.empty,
          textEmptyArray: StringsApp.visitingTabEmptyTextFuture,
        );

  DefaultListView.pastVisite(List<Widget> children)
      : this(
          children: children,
          imageSrcEmptyArray: AssetsApp.goIcon,
          textEmptyArray: StringsApp.visitingTabEmptyTextPast,
        );

  DefaultListView.simpleList(List<Widget> children)
      : this(
          children: children,
          imageSrcEmptyArray: AssetsApp.geolocationIcon,
          textEmptyArray: StringsApp.simpleListEmptyText,
        );

  @override
  Widget build(BuildContext context) {
    if (children.length == 0) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              imageSrcEmptyArray,
              width: 65,
              color: ColorsApp.inactiveBlack,
            ),
            const SizedBox(height: 25),
            Text(
              StringsApp.visitingTabEmptyText,
              style: TextStylesApp.size18Weight500.copyWith(
                color: ColorsApp.inactiveBlack,
              ),
            ),
            const SizedBox(height: 15),
            Container(
              width: 190,
              child: Text(
                textEmptyArray,
                style: TextStylesApp.size15Weight400.copyWith(
                  color: ColorsApp.inactiveBlack,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.only(top: 5),
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 15),
        child: Column(
          children: children
              .map(
                (element) => Container(
                  margin: const EdgeInsets.only(
                    bottom: 16,
                    left: 16,
                    right: 16,
                  ),
                  child: element,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
