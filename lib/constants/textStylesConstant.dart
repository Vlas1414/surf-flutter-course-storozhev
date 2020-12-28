import 'package:flutter/material.dart';
import 'package:places/constants/colorsConstant.dart';

/// Стили текста в приложении places
class TextStylesConstant {
  static const TextStyle _base = TextStyle(
    fontFamily: 'Roboto',
  );

  /// SIZE
  static final TextStyle size14 = _base.copyWith(
    fontSize: 14,
  );
  static final TextStyle size15 = _base.copyWith(
    fontSize: 15,
  );
  static final TextStyle size16 = _base.copyWith(
    fontSize: 16,
  );
  static final TextStyle size18 = _base.copyWith(
    fontSize: 18,
  );
  static final TextStyle size20 = _base.copyWith(
    fontSize: 20,
  );
  static final TextStyle size24 = _base.copyWith(
    fontSize: 24,
  );
  static final TextStyle size32 = _base.copyWith(
    fontSize: 32,
  );

  /// WEIGHT
  static final TextStyle size14WeightBold = size14.copyWith(
    fontWeight: FontWeight.bold,
  );
  static final TextStyle size15Weight400 = size15.copyWith(
    fontWeight: FontWeight.w400,
  );
  static final TextStyle size16Weight500 = size16.copyWith(
    fontWeight: FontWeight.w500,
  );
  static final TextStyle size16Weight700 = size16.copyWith(
    fontWeight: FontWeight.w700,
  );
  static final TextStyle size18Weight500 = size18.copyWith(
    fontWeight: FontWeight.w500,
  );
  static final TextStyle size20Weight500 = size20.copyWith(
    fontWeight: FontWeight.w500,
  );
  static final TextStyle size24WeightBold = size24.copyWith(
    fontWeight: FontWeight.bold,
  );
  static final TextStyle size32WeightBold = size32.copyWith(
    fontWeight: FontWeight.bold,
  );

  /// COLOR
  static final TextStyle size14ColorInactiveBlack = size14.copyWith(
    color: ColorsConstant.inactiveBlack,
  );
  static final TextStyle size14ColorSecondary = size14.copyWith(
    color: ColorsConstant.secondary,
  );
  static final TextStyle size14ColorSecondary2 = size14.copyWith(
    color: ColorsConstant.secondary2,
  );
  static final TextStyle size14ColorGreen = size14.copyWith(
    color: ColorsConstant.green,
  );
  static final TextStyle size14WeightBoldColorWhite = size14WeightBold.copyWith(
    color: ColorsConstant.white,
  );
  static final TextStyle size14WeightBoldColorSecondary =
      size14WeightBold.copyWith(
    color: ColorsConstant.secondary,
  );
  static final TextStyle size15Weight400ColorInactiveBlack =
      size15Weight400.copyWith(
    color: ColorsConstant.inactiveBlack,
  );
  static final TextStyle size16Weight500ColorSecondary =
      size16Weight500.copyWith(
    color: ColorsConstant.secondary,
  );
  static final TextStyle size16Weight700ColorWhite = size16Weight700.copyWith(
    color: ColorsConstant.white,
  );
  static final TextStyle size16Weight700ColorInactiveBlack =
      size16Weight700.copyWith(
    color: ColorsConstant.inactiveBlack,
  );
  static final TextStyle size18Weight500ColorInactiveBlack =
      size18Weight500.copyWith(
    color: ColorsConstant.inactiveBlack,
  );
  static final TextStyle size20Weight500ColorSecondary =
      size20Weight500.copyWith(
    color: ColorsConstant.secondary,
  );
  static final TextStyle size24WeightBoldColorSecondary =
      size24WeightBold.copyWith(
    color: ColorsConstant.secondary,
  );
  static final TextStyle size32WeightBoldColorSecondary =
      size32WeightBold.copyWith(
    color: ColorsConstant.secondary,
  );

  /// HEIGHT
  static final TextStyle size14ColorSecondaryHeight1_4 =
      size14ColorSecondary.copyWith(height: 1.4);
}
