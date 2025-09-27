 
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskingdom/core/utils/colors.dart';
import 'package:taskingdom/gen/fonts.gen.dart';

class AppButtonStyle {

  AppButtonStyle({
    required this.background,
    required this.borderColor, this.textColor = Colors.white,
    this.textStyle,
    this.border,
  });

  factory AppButtonStyle.primary() = AppButtonPrimary;

  factory AppButtonStyle.secondary() = AppButtonSecondary;
  factory AppButtonStyle.outline() = AppButtonOutline;
  final Color background;
  final Color? textColor;
  final Color borderColor;
  final Border? border;
  final TextStyle? textStyle;

  ///Button default values
  static const double buttonDefaultHeight = 58;
  static const double buttonDefaultWidth = double.infinity;
  static const double badgeDefaultHeight = 20;
  static const double badgeDefaultWidth = 46;
  static const double buttonCornerRadius = 14;
  static const double badgeCornerRadius = 100;
  static const double fontSize = 100;
  static const bool buttonIsEnable = true;
  static const bool buttonIsLoading = false;
}

class AppButtonPrimary extends AppButtonStyle {
  AppButtonPrimary()
      : super(
          background: AppColors.primaryColor,
          textColor: Colors.white,
          borderColor: AppColors.primaryColor,
        );
}

class AppButtonSecondary extends AppButtonStyle {
  AppButtonSecondary()
      : super(
          background: AppColors.primaryColor,
          textColor: AppColors.primaryColor,
          borderColor: Colors.transparent,
          textStyle: TextStyle(
            color: AppColors.primaryColor,
            fontSize: 16.sp,
            fontFamily: FontFamily.clash,
          ),
        );
}
class AppButtonOutline extends AppButtonStyle {
  AppButtonOutline()
      : super(
        
          background: AppColors.primaryColor,
          textColor: AppColors.primaryColor,
          borderColor: AppColors.primaryColor,
           border: Border.all(width: 2.sp,color: AppColors.primaryColor),
          textStyle: TextStyle(
            color: AppColors.primaryColor,
            fontSize: 16.sp,
            fontFamily: FontFamily.clash,
          ),
        );
}
