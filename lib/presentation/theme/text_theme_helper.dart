import 'package:flutter/material.dart';
import 'package:gym_bot/core/app_export.dart';

class TextThemeHelper {
  static get bodyMedium13 => theme.textTheme.bodyMedium!.copyWith(
        fontSize: getFontSize(
          13,
        ),
      );
}

extension on TextStyle {
  TextStyle get roboto {
    return copyWith(
      fontFamily: 'Roboto',
    );
  }

  TextStyle get comfortaa {
    return copyWith(
      fontFamily: 'Comfortaa',
    );
  }
}
