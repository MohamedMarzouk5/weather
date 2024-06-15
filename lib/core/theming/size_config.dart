import 'package:flutter/material.dart';

class SizeConfig {
  static const double desktop2 = 1200;
  static const double desktop1 = 800;

  static late double width, height;

  static init(BuildContext context) {
    height = MediaQuery.sizeOf(context).height;
    width = MediaQuery.sizeOf(context).width;
  }
}
