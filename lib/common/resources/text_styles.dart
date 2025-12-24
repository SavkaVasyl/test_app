
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/common/resources/colors.dart';

final class AppTextStyle {
  static TextStyle headLineLarge({final Color? color}) => GoogleFonts.ebGaramond(
    fontWeight: FontWeight.w500,
    fontSize: 32.sp,
    height: 40.h / 32.h,
    letterSpacing: 0,
    textStyle: TextStyle(
      color: color ?? AppColors.grey1,
    ),
  );

  static TextStyle titleLarge({final Color? color}) => GoogleFonts.ebGaramond(
    fontWeight: FontWeight.w500,
    fontSize: 22.sp,
    height: 28.h / 22.h,
    letterSpacing: 0,
    textStyle: TextStyle(
      color: color ?? AppColors.grey1,
    ),
  );

  static TextStyle bodySmall({final Color? color}) => GoogleFonts.ebGaramond(
    fontWeight: FontWeight.w400,
    fontSize: 15.sp,
    height: 18.h / 15.h,
    letterSpacing: 0,
    textStyle: TextStyle(
      color: color ?? AppColors.grey1,
    ),
  );

  static TextStyle bodyMedium({final Color? color}) => GoogleFonts.ebGaramond(
    fontWeight: FontWeight.w700,
    fontSize: 16.sp,
    height: 20.h / 16.h,
    letterSpacing: 0,
    textStyle: TextStyle(
      color: color ?? AppColors.grey1,
    ),
  );
}
