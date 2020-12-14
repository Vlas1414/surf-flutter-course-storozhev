import 'package:flutter/material.dart';
import 'package:places/customColors.dart';

class Styles {
  static const TextStyle appMainTitle = TextStyle(
    color: CustomColors.whiteSecondary,
    fontFamily: 'RobotoMedium',
    fontWeight: FontWeight.bold,
    fontSize: 32,
  );
  static const TextStyle sightCardTitle = TextStyle(
    color: CustomColors.whiteSecondary,
    fontFamily: 'RobotoMedium',
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );
  static const TextStyle sightCardSubtitle = TextStyle(
    color: CustomColors.whiteSecondary2,
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
  static const TextStyle DETAILS_TITLE = TextStyle(
    color: Color.fromARGB(255, 59, 62, 91),
    decoration: TextDecoration.none,
    fontSize: 24,
    fontFamily: 'RobotoMidle',
    fontWeight: FontWeight.bold,
  );
  static const TextStyle DETAILS_TYPE_NAME = TextStyle(
    color: Color.fromARGB(255, 59, 62, 91),
    decoration: TextDecoration.none,
    fontSize: 14,
    fontFamily: 'RobotoMidle',
    fontWeight: FontWeight.bold,
  );
  static const TextStyle DETAILS_SCHEDULE_INFO = TextStyle(
    color: Color.fromARGB(255, 124, 126, 146),
    decoration: TextDecoration.none,
    fontSize: 14,
    fontFamily: 'RobotoMidle',
    fontWeight: FontWeight.normal,
  );
  static const TextStyle DETAILS_DESCRIPTION = TextStyle(
    color: Color.fromARGB(255, 59, 62, 91),
    decoration: TextDecoration.none,
    fontSize: 14,
    fontFamily: 'RobotoMidle',
    fontWeight: FontWeight.normal,
    height: 1.4,
  );
  static const TextStyle DETAILS_BUILD_ROUTE_TEXT_BUTTON = TextStyle(
    color: Colors.white,
    decoration: TextDecoration.none,
    fontSize: 14,
    fontFamily: 'RobotoMidle',
    fontWeight: FontWeight.bold,
  );
  static const TextStyle DETAILS_PLAN_TEXT_BUTTON = TextStyle(
    color: Color.fromARGB(70, 124, 126, 146),
    decoration: TextDecoration.none,
    fontSize: 14,
    fontFamily: 'RobotoMidle',
    fontWeight: FontWeight.normal,
  );
  static const TextStyle DETAILS_LIKE_TEXT_BUTTON = TextStyle(
    color: Color.fromARGB(255, 59, 62, 91),
    decoration: TextDecoration.none,
    fontSize: 14,
    fontFamily: 'RobotoMidle',
    fontWeight: FontWeight.normal,
  );
}
