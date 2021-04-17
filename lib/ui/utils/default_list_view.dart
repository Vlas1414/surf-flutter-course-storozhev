import 'package:flutter/material.dart';
import 'package:places/constants/assets_app.dart';
import 'package:places/constants/colors_app.dart';
import 'package:places/constants/strings_app.dart';
import 'package:places/constants/text_styles_app.dart';

/// Макет стандартного отображения списка для большенства экранов приложения
/// children - список элементов
/// imageSrcEmptyArray - картинка если нет элементов
/// textEmptyArray - текст если нет элементов
class DefaultListView extends StatelessWidget {
  const DefaultListView({
    required this.children,
    required this.imageSrcEmptyArray,
    required this.textEmptyArray,
    Key? key,
  }) : super(key: key);

  const DefaultListView.futureVisite(List<Widget> children, {Key? key})
      : this(
          key: key,
          children: children,
          imageSrcEmptyArray: AssetsApp.empty,
          textEmptyArray: StringsApp.visitingTabEmptyTextFuture,
        );

  const DefaultListView.pastVisite(List<Widget> children, {Key? key})
      : this(
          key: key,
          children: children,
          imageSrcEmptyArray: AssetsApp.goIcon,
          textEmptyArray: StringsApp.visitingTabEmptyTextPast,
        );

  const DefaultListView.simpleList(List<Widget> children, {Key? key})
      : this(
          key: key,
          children: children,
          imageSrcEmptyArray: AssetsApp.geolocationIcon,
          textEmptyArray: StringsApp.simpleListEmptyText,
        );
  final List<Widget> children;
  final String imageSrcEmptyArray;
  final String textEmptyArray;

  @override
  Widget build(BuildContext context) {
    if (children.isEmpty) {
      return SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
            SizedBox(
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
