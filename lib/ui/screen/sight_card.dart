import 'package:flutter/material.dart';
import 'package:places/customColors.dart';
import 'package:places/domain/sight.dart';
import 'package:places/styles.dart';
import 'package:places/ui/image_loading.dart';

/// Виджет места, елемент списка экрана интересных мест
class SightCard extends StatelessWidget {
  /// Объект содержит подробные параметры места
  final Sight sight;
  SightCard({this.sight});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 328 / 188,
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
              child: Container(
                width: double.infinity,
                color: CustomColors.greyTestColor,
                child: Stack(
                  children: [
                    ImageLoading(sight.url),
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
                      child: Image.asset(
                        'assets/images/HeartIcon.png',
                        width: 25,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
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
                      maxLines: 2,
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
