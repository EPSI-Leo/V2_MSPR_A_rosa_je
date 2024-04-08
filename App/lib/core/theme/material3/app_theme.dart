import 'package:arosa_je/core/core.dart';
import 'package:flutter/material.dart';

class ArosajeTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      useMaterial3: true,
      //colorSchemeSeed: primaryColor,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        primary: AppColors.primary,
      ),
      fontFamily: '.SF Pro Text',
      searchBarTheme: SearchBarThemeData(
        elevation: MaterialStateProperty.all(AppDimensions.elevationZero),
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            side: BorderSide(color: AppColors.grey300, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(AppRadius.small)),
          ),
        ),
      ),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        scrolledUnderElevation: AppDimensions.elevationZero,
        titleTextStyle: TextStyle(
          color: AppColors.black,
          fontSize: AppDimensions.large + AppDimensions.tiny,
          fontWeight: FontWeight.w600,
        ),
      ),
      navigationBarTheme: const NavigationBarThemeData(),
      iconTheme: const IconThemeData(color: AppColors.white),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey300),
          borderRadius: BorderRadius.all(Radius.circular(AppRadius.small)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey300),
          borderRadius: BorderRadius.all(Radius.circular(AppRadius.small)),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppRadius.small)),
        ),
      ),
      dialogTheme: DialogTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.small),
        ),
        actionsPadding: const EdgeInsets.all(AppDimensions.base),
      ),
      cardTheme: CardTheme(
        elevation: AppDimensions.elevationZero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.medium),
          side: const BorderSide(color: AppColors.grey300),
        ),
      ),
    );
  }
}
