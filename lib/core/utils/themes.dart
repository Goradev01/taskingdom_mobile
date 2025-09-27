 
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskingdom/core/utils/colors.dart';
import 'package:taskingdom/gen/fonts.gen.dart';

class AppTheme {
  AppTheme._();

    ThemeData lightTheme = _themeData(_lightColorScheme);

  static ThemeData darkTheme = _themeData(_darkColorScheme);

  static ThemeData _themeData(ColorScheme colorScheme) => ThemeData(
        appBarTheme: _appBarTheme(colorScheme),
        brightness: colorScheme.brightness,
        fontFamily: FontFamily.clash,
        scaffoldBackgroundColor: AppColors.background,
        iconTheme: _iconThemeData(colorScheme),
        colorScheme: colorScheme,
        textTheme: _textTheme(colorScheme),
      );

  static final ColorScheme _lightColorScheme =
      const ColorScheme.light().copyWith(
    primary: AppColors.primaryColor,
    secondary: AppColors.primaryColor,
    onPrimary: AppColors.primaryColor,
    surface: AppColors.white,
  );

  static final ColorScheme _darkColorScheme = const ColorScheme.dark().copyWith(
    primary: AppColors.primaryColor,
    secondary: AppColors.primaryColor,
    onPrimary: AppColors.primaryColor,
    surface: AppColors.black,
  );

  static AppBarTheme _appBarTheme(ColorScheme colorScheme) => AppBarTheme(
        color: colorScheme.onSurface,
      );

  static IconThemeData _iconThemeData(ColorScheme colorScheme) =>
      IconThemeData(color: colorScheme.onPrimary);

  static TextTheme _textTheme(ColorScheme colorScheme) => TextTheme(
        titleLarge: TextStyle(
          fontSize: 40.sp,
          fontWeight: FontWeight.w900,
          color: AppColors.black,
          letterSpacing: -1.sp,
          fontFamily: FontFamily.clash,
        ),
        titleSmall: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.black,
          fontFamily: FontFamily.clash,
        ),
        titleMedium: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w700,
          color: AppColors.black,
          fontFamily: FontFamily.clash,
        ),
         bodyLarge: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.black21,
          fontFamily: FontFamily.clash,
        ),
        headlineSmall:TextStyle(
          fontSize: 10.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.white,
          fontFamily: FontFamily.axiforma,
        ) ,
        headlineLarge:TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.black21,
          fontFamily: FontFamily.clash,
        ) ,
        headlineMedium:TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.black21,
          fontFamily: FontFamily.clash,
        ) ,
          bodyMedium: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.white,
          fontFamily: FontFamily.clash,
        ),
        bodySmall: TextStyle(
          fontSize: 10.sp,
          fontWeight: FontWeight.w500,
           color: AppColors.greyC9,
          fontFamily: FontFamily.clash,
        ),
        labelSmall: TextStyle(
          fontSize: 8.sp,
          fontWeight: FontWeight.w500,
           color: AppColors.white,
          fontFamily: FontFamily.clash,
        ),
        labelMedium: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
           color: AppColors.white,
          fontFamily: FontFamily.clash,
        ),
       
      );
}
