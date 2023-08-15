import 'package:flutter/material.dart';
import 'package:products/core/resources/color_app.dart';
import 'package:products/core/resources/fonts.dart';

class AppTheme {
  static final ThemeData theme = ThemeData(
    brightness: Brightness.light,
    fontFamily: Fonts.app,
    buttonBarTheme: const ButtonBarThemeData(buttonPadding: EdgeInsets.zero),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontFamily: Fonts.app,
        fontWeight: FontWeight.w700,
        fontSize: 27,
        color: ColorApp.shellBackground,
      ),
      bodyLarge: TextStyle(
        fontFamily: Fonts.app,
        fontWeight: FontWeight.w700,
        color: ColorApp.shellBackground,
      ),
      bodyMedium: TextStyle(
        fontFamily: Fonts.app,
        fontWeight: FontWeight.w600,
        color: ColorApp.shellBackground,
      ),
      bodySmall: TextStyle(
        fontFamily: Fonts.app,
        fontWeight: FontWeight.w400,
        color: ColorApp.shellBackground,
      ),
    ),
  );
}
