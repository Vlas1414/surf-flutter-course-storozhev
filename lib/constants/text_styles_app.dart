import 'package:flutter/material.dart';

/// Стили текста в приложении places
class TextStylesApp {
  static const TextStyle _base = TextStyle(
    fontFamily: 'Roboto',
  );

  /// SIZE
  static final TextStyle size12 = _base.copyWith(
    fontSize: 12,
  );
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

  /// HEIGHT
  static final TextStyle size14Height1_4 = size14.copyWith(height: 1.4);
}
