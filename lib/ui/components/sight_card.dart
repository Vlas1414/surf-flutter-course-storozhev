import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/constants/stringsConstant.dart';
import 'package:places/constants/assetsConstant.dart';
import 'package:places/constants/colorsConstant.dart';
import 'package:places/constants/textStylesConstant.dart';
import 'package:places/ui/utils/image_loading.dart';

/// Виджет места, елемент списка экрана интересных мест
/// sight - объект содержит подробные параметры места
/// actions - кнопки действий
/// content - дополнительная информация
/// TODO: отображение даты запланированного и посещенного
/// TODO: обработка нажатий кнопок
class SightCard extends StatelessWidget {
  final Sight sight;
  final List<Widget> actions;
  final Widget content;

  SightCard({this.sight, this.actions, this.content});
  SightCard.simple(Sight sight)
      : this(
          sight: sight,
          actions: [
            Image.asset(AssetsConstant.heartIcon, width: 25),
          ],
        );
  SightCard.futureVisite(Sight sight)
      : this(
          sight: sight,
          actions: [
            Image.asset(
              AssetsConstant.calendarIcon,
              width: 25,
              color: ColorsConstant.white,
            ),
            const SizedBox(width: 15),
            Image.asset(AssetsConstant.crossIcon, width: 25),
          ],
          content: Text(
            StringsConstant.visitingPlanAt + "12 окт. 2020",
            style: TextStylesConstant.sightCardSubtitle.copyWith(
              color: ColorsConstant.green,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        );
  SightCard.pastVisite(Sight sight)
      : this(
          sight: sight,
          actions: [
            Image.asset(AssetsConstant.shareIcon, width: 25),
            const SizedBox(width: 15),
            Image.asset(AssetsConstant.crossIcon, width: 25),
          ],
          content: Text(
            StringsConstant.visitingGoalAchievedAt + "12 окт. 2020",
            style: TextStylesConstant.sightCardSubtitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
      decoration: const BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            color: ColorsConstant.greyTestColor,
            child: Stack(
              children: [
                ImageLoading(this.sight?.url),
                Positioned(
                  left: 16,
                  top: 16,
                  child: Text(
                    this.sight.type.toLowerCase(),
                    style: TextStylesConstant.sightCardTypeName,
                  ),
                ),
                Positioned(
                  right: 16,
                  top: 16,
                  child: Row(
                    children: this.actions,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: ColorsConstant.background,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  this.sight?.name,
                  style: TextStylesConstant.sightCardTitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                this.content,
                const SizedBox(height: 5),
                Text(
                  this.sight?.details?.toLowerCase(),
                  style: TextStylesConstant.sightCardSubtitle,
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
