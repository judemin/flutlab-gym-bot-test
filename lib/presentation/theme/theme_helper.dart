import 'dart:ui';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';

String _appTheme = "primary";

/// Helper class for managing themes and colors.
class ThemeHelper {
  // A map of custom color themes supported by the app
  Map<String, PrimaryColors> _supportedCustomColor = {
    'primary': PrimaryColors()
  };

// A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'primary': ColorSchemes.primaryColorScheme
  };

  /// Changes the app theme to [_newTheme].
  void changeTheme(String _newTheme) {
    _appTheme = _newTheme;
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors _getThemeColors() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedCustomColor.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    return _supportedCustomColor[_appTheme] ?? PrimaryColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedColorScheme.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.primaryColorScheme;
    return ThemeData(
      colorScheme: colorScheme,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.onPrimary,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: appTheme.whiteA700,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: colorScheme.primary,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(
              6,
            ),
          ),
        ),
      ),
      textTheme: TextTheme(
        bodyMedium: TextStyle(
          color: colorScheme.onPrimaryContainer,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        ),
        headlineMedium: TextStyle(
          color: appTheme.whiteA700,
          fontSize: getFontSize(
            26,
          ),
          fontFamily: 'Nova Script',
          fontWeight: FontWeight.w400,
        ),
        labelLarge: TextStyle(
          color: appTheme.whiteA700,
          fontSize: getFontSize(
            13,
          ),
          fontFamily: 'Helvetica Neue',
          fontWeight: FontWeight.w700,
        ),
        displaySmall: TextStyle(
          color: appTheme.whiteA700,
          fontSize: getFontSize(
            36,
          ),
          fontFamily: 'Actor',
          fontWeight: FontWeight.w400,
        ),
      ),
      visualDensity: VisualDensity.standard,
    );
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static final primaryColorScheme = ColorScheme.light(
    onPrimary: Color(0XFF1B1B1B),
    shadow: Color(0XFF1B1B1B),
    onPrimaryContainer: Color(0XFF9E9E9E),
    onTertiary: Color(0XFF9E9E9E),
    scrim: Color(0XFF1B1B1B),
    primaryContainer: Color(0XFF1B1B1B),
    tertiaryContainer: Color(0XFF3D68FF),
    secondaryContainer: Color(0XFF3D68FF),
    error: Color(0XFF1B1B1B),
    onErrorContainer: Color(0XFF1B1B1B),
    outline: Color(0XFF1B1B1B),
    onSurfaceVariant: Color(0XFF1B1B1B),
    onBackground: Color(0XFF9E9E9E),
    outlineVariant: Color(0XFF1B1B1B),
    errorContainer: Color(0XFF3D68FF),
    onSurface: Color(0XFF9E9E9E),
    onError: Color(0XFF9E9E9E),
    surface: Color(0XFF1B1B1B),
    onInverseSurface: Color(0XFF9E9E9E),
    onSecondaryContainer: Color(0XFF1B1B1B),
    tertiary: Color(0XFF1B1B1B),
    surfaceTint: Color(0XFF1B1B1B),
    onTertiaryContainer: Color(0XFF1B1B1B),
    surfaceVariant: Color(0XFF3D68FF),
    inversePrimary: Color(0XFF1B1B1B),
    secondary: Color(0XFF1B1B1B),
    inverseSurface: Color(0XFF1B1B1B),
    background: Color(0XFF1B1B1B),
    onSecondary: Color(0XFF9E9E9E),
    primary: Color(0XFF3D68FF),
  );
}

/// Class containing custom colors for a primary theme.
class PrimaryColors {
  Color get primaryVariant => Color(0XFF1B1B1B);
  Color get secondaryVariant => Color(0XFF3D68FF);
  Color get teal500 => Color(0XFF08AA6B);
  Color get blueGray700 => Color(0XFF50555C);
  Color get gray700 => Color(0XFF58606C);
  Color get whiteA700 => Color(0XFFFFFFFF);
  Color get greenA700 => Color(0XFF00C035);
  Color get whiteA70001 => Color(0XFFFEFEFE);
  Color get amberA400 => Color(0XFFE4BF00);
  Color get blueGray400 => Color(0XFF888888);
  Color get black900 => Color(0XFF000000);
}

PrimaryColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();
