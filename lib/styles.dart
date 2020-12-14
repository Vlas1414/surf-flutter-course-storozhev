import 'package:flutter/material.dart';
import 'package:places/customColors.dart';

class Styles {
  static const TextStyle appMainTitle = TextStyle(
    color: CustomColors.secondary,
    fontFamily: 'RobotoMedium',
    fontWeight: FontWeight.bold,
    fontSize: 32,
  );
  static const TextStyle sightCardTitle = TextStyle(
    color: CustomColors.secondary,
    fontFamily: 'RobotoMedium',
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );
  static const TextStyle sightCardSubtitle = TextStyle(
    color: CustomColors.secondary2,
    fontFamily: 'RobotoMedium',
    fontWeight: FontWeight.normal,
    fontSize: 14,
  );
  static const TextStyle sightCardTypeName = TextStyle(
    color: CustomColors.white,
    fontFamily: 'RobotoMedium',
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );
  //* SCREEN DETAILS
  static const TextStyle detailsTitle = TextStyle(
    color: CustomColors.secondary,
    decoration: TextDecoration.none,
    fontSize: 24,
    fontFamily: 'RobotoMidle',
    fontWeight: FontWeight.bold,
  );
  static const TextStyle detailsTypeName = TextStyle(
    color: CustomColors.secondary,
    decoration: TextDecoration.none,
    fontSize: 14,
    fontFamily: 'RobotoMidle',
    fontWeight: FontWeight.bold,
  );
  static const TextStyle detailsScheduleInfo = TextStyle(
    color: CustomColors.secondary2,
    decoration: TextDecoration.none,
    fontSize: 14,
    fontFamily: 'RobotoMidle',
    fontWeight: FontWeight.normal,
  );
  static const TextStyle detailsDescription = TextStyle(
    color: CustomColors.secondary,
    decoration: TextDecoration.none,
    fontSize: 14,
    fontFamily: 'RobotoMidle',
    fontWeight: FontWeight.normal,
    height: 1.4,
  );
  static const TextStyle detailsBuildRouteTextButton = TextStyle(
    color: Colors.white,
    decoration: TextDecoration.none,
    fontSize: 14,
    fontFamily: 'RobotoMidle',
    fontWeight: FontWeight.bold,
  );
  static const TextStyle detailsPlanTextButton = TextStyle(
    color: CustomColors.inactiveBlack,
    decoration: TextDecoration.none,
    fontSize: 14,
    fontFamily: 'RobotoMidle',
    fontWeight: FontWeight.normal,
  );
  static const TextStyle detailsLikeTextButton = TextStyle(
    color: CustomColors.secondary,
    decoration: TextDecoration.none,
    fontSize: 14,
    fontFamily: 'RobotoMidle',
    fontWeight: FontWeight.normal,
  );
}
