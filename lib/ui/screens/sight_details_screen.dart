import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/constants/assetsApp.dart';
import 'package:places/constants/colorsApp.dart';
import 'package:places/constants/stringsApp.dart';
import 'package:places/constants/textStylesApp.dart';
import 'package:places/ui/utils/default_accept_button.dart';
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
                    margin: const EdgeInsets.only(top: 40, left: 10),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(6),
                        minimumSize: const Size.square(0),
                        primary: Theme.of(context).textTheme.headline1!.color,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Theme.of(context).backgroundColor,
                      ),
                      onPressed: () => print('Tap back'),
                      child: Image.asset(
                        AssetsApp.arrowIcon,
                        width: 24,
                        height: 24,
                        color: Theme.of(context).textTheme.headline1!.color,
                      ),
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
              padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    StringsApp.detailsTitle,
                    style: TextStylesApp.size24WeightBold.copyWith(
                      color: Theme.of(context).textTheme.headline1!.color,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      Text(
                        StringsApp.detailsTypeName.toLowerCase(),
                        style: TextStylesApp.size14WeightBold.copyWith(
                          color: Theme.of(context).textTheme.headline2!.color,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        StringsApp.detailsScheduleInfo.toLowerCase(),
                        style: TextStylesApp.size14.copyWith(
                          color: Theme.of(context).textTheme.headline3!.color,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    StringsApp.detailsDescription,
                    style: TextStylesApp.size14Height1_4.copyWith(
                        color: Theme.of(context).textTheme.headline1!.color),
                  ),
                  const SizedBox(height: 24),
                  DefaultAcceptButton(
                    icon: AssetsApp.goIcon,
                    text: StringsApp.detailsBuildRouteTextButton,
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
                      CupertinoButton(
                        minSize: 0,
                        padding: EdgeInsets.zero,
                        onPressed: () => print('Tap plan'),
                        child: Row(
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
                              style: TextStylesApp.size14.copyWith(
                                color: ColorsApp.inactiveBlack,
                              ),
                            ),
                          ],
                        ),
                      ),
                      CupertinoButton(
                        minSize: 0,
                        padding: EdgeInsets.zero,
                        onPressed: () => print('Tap to favorite'),
                        child: Row(
                          children: [
                            Image.asset(
                              AssetsApp.heartIcon,
                              width: 24,
                              height: 24,
                              color:
                                  Theme.of(context).textTheme.headline1!.color,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              StringsApp.detailsLikeTextButton,
                              style: TextStylesApp.size14.copyWith(
                                color:
                                    Theme.of(context).textTheme.headline1!.color,
                              ),
                            ),
                          ],
                        ),
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
