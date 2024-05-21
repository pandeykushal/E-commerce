import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:np_com_pandeykushal/view_model/utils/colors.dart';

import '../utils/fonts.dart';

class CustomTheme {
  static ThemeData appTheme() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
    ));
    return ThemeData(
      scaffoldBackgroundColor: AppColor.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColor.white,
        centerTitle: true,
        foregroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: TextStyle(
            color: AppColor.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
            letterSpacing: -0.24),
        shadowColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: AppColor.black,
          size: 20,
        ),
      ),
      fontFamily: "Inter",
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return AppColor.primary;
            }
            return AppColor.primary;
          },
        ),
        trackColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return AppColor.white;
          } else {
            return AppColor.black;
          }
        }),
        trackOutlineColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return AppColor.black;
          } else {
            return AppColor.white;
          }
        }),
      ),
      // primaryColor: AppColor.white,
      // brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
          primary: AppColor.primary1,
          secondary: AppColor.primary,
          brightness: Brightness.dark),
      textTheme: TextTheme(
        displaySmall: TextStyle(
            fontSize: 30,
            color: AppColor.black,
            fontFamily: AppFontFamily.appFont),
        bodyLarge: TextStyle(
            fontSize: 24,
            color: AppColor.black,
            fontFamily: AppFontFamily.appFont),
        bodyMedium: TextStyle(
            fontSize: 22,
            color: AppColor.black,
            fontFamily: AppFontFamily.appFont),
        bodySmall: TextStyle(
            fontSize: 20,
            color: AppColor.black,
            fontFamily: AppFontFamily.appFont),
        titleLarge: TextStyle(
            fontSize: 18,
            color: AppColor.black,
            fontFamily: AppFontFamily.appFont),
        titleMedium: TextStyle(
            fontSize: 16,
            color: AppColor.black,
            fontFamily: AppFontFamily.appFont),
        titleSmall: TextStyle(
            fontSize: 14,
            color: AppColor.black,
            fontFamily: AppFontFamily.appFont),
        labelLarge: TextStyle(
            fontSize: 12,
            color: AppColor.black,
            fontFamily: AppFontFamily.appFont),
        labelMedium: TextStyle(
            fontSize: 11,
            color: AppColor.black,
            fontFamily: AppFontFamily.appFont),
        labelSmall: TextStyle(
            fontSize: 10,
            color: AppColor.black,
            fontFamily: AppFontFamily.appFont),
      ),
      splashColor: AppColor.primary,
    );
  }
}
