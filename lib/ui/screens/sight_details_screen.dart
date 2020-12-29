import 'package:flutter/material.dart';
import 'package:places/constants/assetsApp.dart';
import 'package:places/constants/colorsApp.dart';
import 'package:places/constants/stringsApp.dart';
import 'package:places/constants/textStylesApp.dart';
import 'package:places/ui/utils/image_loading.dart';

/// Экран подробной информации о посещаемом месте
class SightDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              width: double.infinity,
              color: Colors.grey,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: ImageLoading(
                      'https://dv-gazeta.info/wp-content/uploads/2018/02/17.jpg',
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 48, left: 16),
                    width: 32,
                    height: 32,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Image.asset(
                      AssetsApp.arrowIcon,
                      width: 24,
                      height: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    StringsApp.detailsTitle,
                    style: TextStylesApp.size24WeightBoldColorSecondary,
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      Text(
                        StringsApp.detailsTypeName.toLowerCase(),
                        style: TextStylesApp.size14WeightBoldColorSecondary,
                      ),
                      const SizedBox(width: 16),
                      Text(
                        StringsApp.detailsScheduleInfo.toLowerCase(),
                        style: TextStylesApp.size14ColorSecondary2,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    StringsApp.detailsDescription,
                    style: TextStylesApp.size14ColorSecondaryHeight1_4,
                  ),
                  const SizedBox(height: 24),
                  Container(
                    width: double.infinity,
                    height: 48,
                    decoration: const BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: ColorsApp.green,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AssetsApp.goIcon,
                          width: 25,
                          height: 25,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          StringsApp.detailsBuildRouteTextButton.toUpperCase(),
                          style: TextStylesApp.size14WeightBoldColorWhite,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: ColorsApp.inactiveBlack,
                  ),
                  const SizedBox(height: 19),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            AssetsApp.calendarIcon,
                            width: 24,
                            height: 24,
                            color: ColorsApp.inactiveBlack,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            StringsApp.detailsPlanTextButton,
                            style: TextStylesApp.size14ColorInactiveBlack,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset(
                            AssetsApp.heartIcon,
                            width: 24,
                            height: 24,
                            color: ColorsApp.secondary,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            StringsApp.detailsLikeTextButton,
                            style: TextStylesApp.size14ColorSecondary,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
