import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/constants/strings_app.dart';
import 'package:places/constants/assets_app.dart';
import 'package:places/constants/colors_app.dart';
import 'package:places/constants/text_styles_app.dart';
import 'package:places/ui/utils/image_loading.dart';

/// класс кнопки на карточке
/// child - виджет кнопки
/// func - обработка нажатия по кнопке
class ActionButton {
  ActionButton({required this.child, this.func});

  Widget child;
  Function? func;
}

/// Виджет места, елемент списка экрана интересных мест
/// sight - объект содержит подробные параметры места
/// actions - кнопки действий
/// content - дополнительная информация
/// TODO: отображение даты запланированного и посещенного
class SightCard extends StatelessWidget {
  const SightCard({
    required this.sight,
    this.actions,
    this.content,
    Key? key,
  }) : super(key: key);

  SightCard.simple(Sight sight, {Key? key})
      : this(
          key: key,
          sight: sight,
          actions: [
            actionButton(
              child: Image.asset(AssetsApp.heartIcon, width: 25),
              // ignore: avoid_print
              onPressed: () => print('Tap heartIcon'),
            )
          ],
        );

  SightCard.futureVisite(Sight sight, {Key? key})
      : this(
          key: key,
          sight: sight,
          actions: [
            actionButton(
              child: Image.asset(
                AssetsApp.calendarIcon,
                width: 25,
                color: ColorsApp.white,
              ),
              // ignore: avoid_print
              onPressed: () => print('Tap calendarIcon'),
            ),
            actionButton(
              child: Image.asset(AssetsApp.crossIcon, width: 25),
              // ignore: avoid_print
              onPressed: () => print('Tap crossIcon'),
            ),
          ],
          content: Text(
            '${StringsApp.visitingPlanAt}12 окт. 2020',
            style: TextStylesApp.size14.copyWith(
              color: ColorsApp.green,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        );

  SightCard.pastVisite(Sight sight, {Key? key})
      : this(
          key: key,
          sight: sight,
          actions: [
            actionButton(
              child: Image.asset(AssetsApp.shareIcon, width: 25),
              // ignore: avoid_print
              onPressed: () => print('Tap shareIcon'),
            ),
            actionButton(
              child: Image.asset(AssetsApp.crossIcon, width: 25),
              // ignore: avoid_print
              onPressed: () => print('Tap crossIcon 2'),
            ),
          ],
          content: Text(
            '${StringsApp.visitingGoalAchievedAt}12 окт. 2020',
            style: TextStylesApp.size14.copyWith(
              color: ColorsApp.secondary2,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        );
  @required
  final Sight sight;
  final List<Widget>? actions;
  final Widget? content;

  static Widget actionButton(
      {required Widget child, required Function() onPressed}) {
    return CupertinoButton(
      padding: const EdgeInsets.only(right: 15, top: 15),
      minSize: 0,
      onPressed: onPressed,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 100,
                width: double.infinity,
                color: ColorsApp.greyTestColor,
                child: ImageLoading(sight.url),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                color: Theme.of(context).primaryColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      sight.name,
                      style: TextStylesApp.size16Weight500.copyWith(
                          color: Theme.of(context).textTheme.headline1!.color),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (content != null) content!,
                    const SizedBox(height: 5),
                    Text(
                      sight.details.toLowerCase(),
                      style: TextStylesApp.size14.copyWith(
                        color: ColorsApp.secondary2,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                // ignore: avoid_print
                onTap: () => print('Tap on cart'),
                highlightColor: Colors.transparent,
              ),
            ),
          ),
          Positioned(
            left: 16,
            top: 16,
            child: Text(
              sight.type.text.toLowerCase(),
              style: TextStylesApp.size14WeightBold.copyWith(
                color: ColorsApp.white,
              ),
            ),
          ),
          if (actions != null)
            Positioned(
              right: 0,
              top: 0,
              child: Row(
                children: actions!,
              ),
            ),
        ],
      ),
    );
  }
}
