import 'package:flutter/material.dart';
import 'package:gym_bot/core/app_export.dart';

class AppDecoration {
  static BoxDecoration get fill => BoxDecoration(
        color: theme.colorScheme.onPrimary,
      );
  static BoxDecoration get fill1 => BoxDecoration(
        color: appTheme.whiteA700,
      );
  static BoxDecoration get txtOutline => BoxDecoration(
        color: appTheme.whiteA700,
        border: Border.all(
          color: appTheme.blueGray700,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get txtOutline2 => BoxDecoration(
        color: appTheme.greenA700,
        border: Border.all(
          color: appTheme.greenA700,
          width: getHorizontalSize(
            2,
          ),
        ),
      );
  static BoxDecoration get txtOutline1 => BoxDecoration(
        color: appTheme.amberA400,
        border: Border.all(
          color: appTheme.amberA400,
          width: getHorizontalSize(
            2,
          ),
        ),
      );
}

class BorderRadiusStyle {
  static BorderRadius txtRoundedBorder6 = BorderRadius.circular(
    getHorizontalSize(
      6,
    ),
  );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
