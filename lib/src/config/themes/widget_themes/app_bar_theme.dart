import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quotes/src/core/utils/app_strings.dart';

class AppBarThemes {
  static AppBarTheme appBarTheme({required bool isLight}) {
    SystemUiOverlayStyle systemOverlayStyle = isLight
        ? const SystemUiOverlayStyle(
            systemNavigationBarColor: Colors.transparent,
            systemNavigationBarDividerColor: Colors.transparent,
            systemNavigationBarIconBrightness: Brightness.dark,
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark,
          )
        : const SystemUiOverlayStyle(
            systemNavigationBarColor: Colors.transparent,
            systemNavigationBarDividerColor: Colors.transparent,
            systemNavigationBarIconBrightness: Brightness.light,
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.light,
          );

    return AppBarTheme(
      systemOverlayStyle: systemOverlayStyle,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      titleTextStyle: TextStyle(
        fontFamily: AppStrings.fontFamily,
        fontSize: 25,
        color: isLight ? Colors.black : Colors.white,
        fontWeight: FontWeight.bold,
      ),
      elevation: 0,
    );
  }
}
