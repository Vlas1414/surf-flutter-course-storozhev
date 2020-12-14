import 'package:flutter/material.dart';
import 'package:places/customColors.dart';
import 'package:places/strings.dart';
import 'package:places/styles.dart';

//Экран отображения подробной информации о посещаемом месте
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
                  child: Container(
                    color: Colors.black,
                    width: 15,
                    height: 15,
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
                      Container(
                        color: Colors.white,
                        width: 20,
                        height: 20,
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
                        Container(
                          width: 20,
                          height: 20,
                          color: CustomColors.inactiveBlack,
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
                        Container(
                          width: 20,
                          height: 20,
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
