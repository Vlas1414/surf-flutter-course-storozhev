import 'package:flutter/material.dart';
import 'package:places/constants/assetsConstant.dart';
import 'package:places/constants/colorsConstant.dart';
import 'package:places/constants/stringsConstant.dart';
import 'package:places/constants/textStylesConstant.dart';
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
                      AssetsConstant.arrowIcon,
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
                    StringsConstant.detailsTitle,
                    style: TextStylesConstant.size24WeightBoldColorSecondary,
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      Text(
                        StringsConstant.detailsTypeName.toLowerCase(),
                        style:
                            TextStylesConstant.size14WeightBoldColorSecondary,
                      ),
                      const SizedBox(width: 16),
                      Text(
                        StringsConstant.detailsScheduleInfo.toLowerCase(),
                        style: TextStylesConstant.size14ColorSecondary2,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    StringsConstant.detailsDescription,
                    style: TextStylesConstant.size14ColorSecondaryHeight1_4,
                  ),
                  const SizedBox(height: 24),
                  Container(
                    width: double.infinity,
                    height: 48,
                    decoration: const BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: ColorsConstant.green,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AssetsConstant.goIcon,
                          width: 25,
                          height: 25,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          StringsConstant.detailsBuildRouteTextButton
                              .toUpperCase(),
                          style: TextStylesConstant.size14WeightBoldColorWhite,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: ColorsConstant.inactiveBlack,
                  ),
                  const SizedBox(height: 19),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            AssetsConstant.calendarIcon,
                            width: 24,
                            height: 24,
                            color: ColorsConstant.inactiveBlack,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            StringsConstant.detailsPlanTextButton,
                            style: TextStylesConstant.size14ColorInactiveBlack,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset(
                            AssetsConstant.heartIcon,
                            width: 24,
                            height: 24,
                            color: ColorsConstant.secondary,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            StringsConstant.detailsLikeTextButton,
                            style: TextStylesConstant.size14ColorSecondary,
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
