import 'package:flutter/material.dart';

class Utils {
  Color convertHexToColor(String hex) =>
      Color(int.parse(hex.replaceAll('#', '0xff')));
}
