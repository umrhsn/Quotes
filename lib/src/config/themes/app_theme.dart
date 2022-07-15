import 'package:flutter/material.dart';
import 'package:quotes/src/config/themes/widget_themes/app_bar_theme.dart';
import 'package:quotes/src/core/utils/app_colors.dart';
import 'package:quotes/src/core/utils/app_strings.dart';

class AppThemes {
  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      appBarTheme: AppBarThemes.appBarTheme(isLight: true),
      primaryColor: AppColors.primary,
      fontFamily: AppStrings.fontFamily,
      textTheme: const TextTheme(
        bodyMedium: TextStyle(height: 1.3, fontSize: 20, color: Colors.white),
      ),
    );
  }

  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      appBarTheme: AppBarThemes.appBarTheme(isLight: false),
      primaryColor: AppColors.primary,
      fontFamily: AppStrings.fontFamily,
    );
  }
}
