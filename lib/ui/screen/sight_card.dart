import 'package:flutter/material.dart';
import 'package:places/customColors.dart';
import 'package:places/domain/sight.dart';
import 'package:places/styles.dart';

//виджет места, отображает основные параметры, елемент списка экрана интересных мест
class SightCard extends StatelessWidget {
  //объект модели Sight, содержит подробные параметры места
  final Sight sight;
  SightCard({this.sight});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3.7 / 2,
      child: Container(
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: CustomColors.greyTestColor,
                width: double.infinity,
                child: Stack(
                  children: [
                    Positioned(
                      left: 16,
                      top: 16,
                      child: Text(
                        sight.type.toLowerCase(),
                        style: Styles.sightCardTypeName,
                      ),
                    ),
                    Positioned(
                      right: 16,
                      top: 16,
                      child: Container(
                        width: 20,
                        height: 20,
                        color: CustomColors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                color: CustomColors.background,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 5),
                    Text(
                      sight.name,
                      style: Styles.sightCardTitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      sight.details.toLowerCase(),
                      style: Styles.sightCardSubtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
