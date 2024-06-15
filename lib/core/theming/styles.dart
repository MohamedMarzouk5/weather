import 'package:flutter/material.dart';
import 'package:weather/core/theming/colors.dart';
import 'package:weather/core/theming/size_config.dart';

abstract class AppStyles {
  static TextStyle styleBold15(BuildContext context) {
    return TextStyle(
      color: AppColors.kBlackColor,
      fontSize: getResponsiveFontSize(context, fontSize: 25),
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleMedium30(BuildContext context) {
    return TextStyle(
      color: AppColors.kBlackColor,
      fontSize: getResponsiveFontSize(context, fontSize: 30),
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleReg20(BuildContext context) {
    return TextStyle(
      color: AppColors.kBlackColor,
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontWeight: FontWeight.w400,
    );
  }
}

double getResponsiveFontSize(context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(context) {
  double width = MediaQuery.sizeOf(context).width;
  if (width < SizeConfig.desktop1) {
    return width / 550;
  } else if (width < SizeConfig.desktop2) {
    return width / 1000;
  } else {
    return width / 1920;
  }
}
