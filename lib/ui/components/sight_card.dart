import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/constants/stringsApp.dart';
import 'package:places/constants/assetsApp.dart';
import 'package:places/constants/colorsApp.dart';
import 'package:places/constants/textStylesApp.dart';
import 'package:places/ui/utils/image_loading.dart';

/// Виджет места, елемент списка экрана интересных мест
/// sight - объект содержит подробные параметры места
/// actions - кнопки действий
/// content - дополнительная информация
/// TODO: отображение даты запланированного и посещенного
/// TODO: обработка нажатий кнопок
class SightCard extends StatelessWidget {
  @required
  final Sight sight;
  final List<Widget> actions;
  final Widget content;

  SightCard({this.sight, this.actions, this.content}) : assert(sight != null);

  SightCard.simple(Sight sight)
      : this(
          sight: sight,
          actions: [
            Image.asset(AssetsApp.heartIcon, width: 25),
          ],
        );

  SightCard.futureVisite(Sight sight)
      : this(
          sight: sight,
          actions: [
            Image.asset(
              AssetsApp.calendarIcon,
              width: 25,
              color: ColorsApp.white,
            ),
            const SizedBox(width: 15),
            Image.asset(AssetsApp.crossIcon, width: 25),
          ],
          content: Text(
            StringsApp.visitingPlanAt + "12 окт. 2020",
            style: TextStylesApp.size14ColorGreen,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        );

  SightCard.pastVisite(Sight sight)
      : this(
          sight: sight,
          actions: [
            Image.asset(AssetsApp.shareIcon, width: 25),
            const SizedBox(width: 15),
            Image.asset(AssetsApp.crossIcon, width: 25),
          ],
          content: Text(
            StringsApp.visitingGoalAchievedAt + "12 окт. 2020",
            style: TextStylesApp.size14ColorSecondary2,
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
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            color: ColorsApp.greyTestColor,
            child: Stack(
              children: [
                ImageLoading(sight.url),
                Positioned(
                  left: 16,
                  top: 16,
                  child: Text(
                    sight.type.toLowerCase(),
                    style: TextStylesApp.size14WeightBoldColorWhite,
                  ),
                ),
                actions != null
                    ? Positioned(
                        right: 16,
                        top: 16,
                        child: Row(
                          children: actions,
                        ),
                      )
                    : null,
              ].where((child) => child != null).toList(),
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: ColorsApp.background,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sight.name,
                  style: TextStylesApp.size16Weight500ColorSecondary,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                content,
                const SizedBox(height: 5),
                Text(
                  sight.details.toLowerCase(),
                  style: TextStylesApp.size14ColorSecondary2,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ].where((child) => child != null).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
