import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/constants/stringsApp.dart';
import 'package:places/constants/assetsApp.dart';
import 'package:places/constants/colorsApp.dart';
import 'package:places/constants/textStylesApp.dart';
import 'package:places/ui/utils/image_loading.dart';

/// класс кнопки на карточке
/// child - виджет кнопки
/// func - обработка нажатия по кнопке
class ActionButton {
  Widget child;
  Function? func;
  ActionButton({required this.child, this.func}) : assert(child != null);
}

/// Виджет места, елемент списка экрана интересных мест
/// sight - объект содержит подробные параметры места
/// actions - кнопки действий
/// content - дополнительная информация
/// TODO: отображение даты запланированного и посещенного
class SightCard extends StatelessWidget {
  @required
  final Sight sight;
  final List<ActionButton>? actions;
  final Widget? content;

  SightCard({required this.sight, this.actions, this.content}) : assert(sight != null);

  SightCard.simple(Sight sight)
      : this(
          sight: sight,
          actions: [
            ActionButton(
              child: Image.asset(AssetsApp.heartIcon, width: 25),
              func: () => print('Tap heartIcon'),
            )
          ],
        );

  SightCard.futureVisite(Sight sight)
      : this(
          sight: sight,
          actions: [
            ActionButton(
              child: Image.asset(
                AssetsApp.calendarIcon,
                width: 25,
                color: ColorsApp.white,
              ),
              func: () => print('Tap calendarIcon'),
            ),
            ActionButton(
              child: Image.asset(AssetsApp.crossIcon, width: 25),
              func: () => print('Tap crossIcon'),
            ),
          ],
          content: Text(
            StringsApp.visitingPlanAt + "12 окт. 2020",
            style: TextStylesApp.size14.copyWith(
              color: ColorsApp.green,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        );

  SightCard.pastVisite(Sight sight)
      : this(
          sight: sight,
          actions: [
            ActionButton(
              child: Image.asset(AssetsApp.shareIcon, width: 25),
              func: () => print('Tap shareIcon'),
            ),
            ActionButton(
              child: Image.asset(AssetsApp.crossIcon, width: 25),
              func: () => print('Tap crossIcon 2'),
            ),
          ],
          content: Text(
            StringsApp.visitingGoalAchievedAt + "12 окт. 2020",
            style: TextStylesApp.size14.copyWith(
              color: ColorsApp.secondary2,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
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
                onTap: () {
                  print('Tap on cart');
                },
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
                children: actions!
                    .map(
                      (e) => CupertinoButton(
                        padding: const EdgeInsets.all(16.0),
                        minSize: 0,
                        child: e.child,
                        onPressed: e.func as void Function()?,
                      ),
                    )
                    .toList(),
              ),
            ),
        ],
      ),
    );
  }
}
