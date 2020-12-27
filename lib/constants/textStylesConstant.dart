import 'package:flutter/material.dart';
import 'package:places/constants/colorsConstant.dart';

class TextStylesConstant {
  static const TextStyle appdDefaultTitle = TextStyle(
    color: ColorsConstant.secondary,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w500,
    fontSize: 20,
  );

  /// SCREEN SIGHT_LIST
  static const TextStyle appMainTitle = TextStyle(
    color: ColorsConstant.secondary,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.bold,
    fontSize: 32,
  );

  /// SCREEN SIGHT_CARDS
  static const TextStyle sightCardTitle = TextStyle(
    color: ColorsConstant.secondary,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );
  static const TextStyle sightCardSubtitle = TextStyle(
    color: ColorsConstant.secondary2,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.normal,
    fontSize: 14,
  );
  static const TextStyle sightCardTypeName = TextStyle(
    color: ColorsConstant.white,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );

  /// SCREEN SIGHT_DETAILS
  static const TextStyle detailsTitle = TextStyle(
    color: ColorsConstant.secondary,
    decoration: TextDecoration.none,
    fontSize: 24,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.bold,
  );
  static const TextStyle detailsTypeName = TextStyle(
    color: ColorsConstant.secondary,
    decoration: TextDecoration.none,
    fontSize: 14,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.bold,
  );
  static const TextStyle detailsScheduleInfo = TextStyle(
    color: ColorsConstant.secondary2,
    decoration: TextDecoration.none,
    fontSize: 14,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.normal,
  );
  static const TextStyle detailsDescription = TextStyle(
    color: ColorsConstant.secondary,
    decoration: TextDecoration.none,
    fontSize: 14,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.normal,
    height: 1.4,
  );
  static const TextStyle detailsBuildRouteTextButton = TextStyle(
    color: Colors.white,
    decoration: TextDecoration.none,
    fontSize: 14,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.bold,
  );
  static const TextStyle detailsPlanTextButton = TextStyle(
    color: ColorsConstant.inactiveBlack,
    decoration: TextDecoration.none,
    fontSize: 14,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.normal,
  );
  static const TextStyle detailsLikeTextButton = TextStyle(
    color: ColorsConstant.secondary,
    decoration: TextDecoration.none,
    fontSize: 14,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.normal,
  );

  /// SCREEN VISITING
  static const TextStyle visitingTabTitle = TextStyle(
    color: ColorsConstant.white,
    decoration: TextDecoration.none,
    fontSize: 16,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w700,
  );
  static const TextStyle visitingTabEmptyText = TextStyle(
    color: ColorsConstant.inactiveBlack,
    decoration: TextDecoration.none,
    fontSize: 15,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
  );
}
