import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graduation_project/shared/styles/app_colors.dart';

abstract class AppTheme
{
  static ThemeData appTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: AppColors.primaryColor,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.white,
      foregroundColor: AppColors.primaryColor,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarBrightness: Brightness.dark,
      ),
      elevation: 0,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 20,
        color: AppColors.primaryColor,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      selectedIconTheme: IconThemeData(
        color: AppColors.primaryColor,
      ),
      unselectedIconTheme: IconThemeData(
        color: AppColors.primaryColor,
      ),
      elevation: 2.0,
    ),
    datePickerTheme: DatePickerThemeData(
      headerBackgroundColor: Colors.white,
      headerForegroundColor: AppColors.primaryColor,
      backgroundColor: Colors.white,
    ),
  );
}
