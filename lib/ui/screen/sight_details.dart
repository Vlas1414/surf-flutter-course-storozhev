import 'package:flutter/material.dart';
import 'package:places/assets.dart';
import 'package:places/customColors.dart';
import 'package:places/strings.dart';
import 'package:places/styles.dart';
import 'package:places/ui/image_loading.dart';

/// Экран подробной информации о посещаемом месте
class SightDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
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
                      'https://dv-gazeta.info/wp-content/uploads/2018/02/17.jpg'),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 48, left: 16),
                  width: 32,
                  height: 32,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Image.asset(
                    Assets.arrowIcon,
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
                  Strings.detailsTitle,
                  style: Styles.detailsTitle,
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    Text(
                      Strings.detailsTypeName.toLowerCase(),
                      style: Styles.detailsTypeName,
                    ),
                    const SizedBox(width: 16),
                    Text(
                      Strings.detailsScheduleInfo.toLowerCase(),
                      style: Styles.detailsScheduleInfo,
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Text(
                  Strings.detailsDescription,
                  style: Styles.detailsDescription,
                ),
                const SizedBox(height: 24),
                Container(
                  width: double.infinity,
                  height: 48,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: CustomColors.green,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        Assets.goIcon,
                        width: 25,
                        height: 25,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        Strings.detailsBuildRouteTextButton.toUpperCase(),
                        style: Styles.detailsBuildRouteTextButton,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: CustomColors.inactiveBlack,
                ),
                const SizedBox(height: 19),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          Assets.calendarIcon,
                          width: 24,
                          height: 24,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          Strings.detailsPlanTextButton,
                          style: Styles.detailsPlanTextButton,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset(
                          Assets.heartIcon,
                          width: 24,
                          height: 24,
                          color: CustomColors.secondary,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          Strings.detailsLikeTextButton,
                          style: Styles.detailsLikeTextButton,
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
    );
  }
}
