import 'package:flutter/material.dart';
import 'package:spendify/core/theme/app_pallete.dart';

class AppTheme {
  static _border([Color color = AppPallete.primaryTextColor]) =>
      OutlineInputBorder(
          borderSide: BorderSide(
            color: color,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(10));

  static _getSystemBrightness(BuildContext context) =>
      MediaQuery.of(context).platformBrightness;

  static final lightThemeMode = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppPallete.backgroundColor,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(27),
      enabledBorder: _border(),
      focusedBorder: _border(AppPallete.accentColor1),
    ),
  );
  static final darkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppPallete.backgroundColorDark,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(27),
      enabledBorder: _border(AppPallete.primaryTextColorDark),
      focusedBorder: _border(AppPallete.accentColor1),
    ),
  );

  static ThemeData getTheme(BuildContext context) {
    return _getSystemBrightness(context) == Brightness.dark
        ? darkThemeMode
        : lightThemeMode;
  }

  static Color getPrimaryTextColor(BuildContext context) {
    return _getSystemBrightness(context) == Brightness.dark
        ? AppPallete.primaryTextColorDark
        : AppPallete.primaryTextColor;
  }
}
