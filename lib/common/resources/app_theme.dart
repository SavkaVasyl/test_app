import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/common/resources/colors.dart';

ThemeData appTheme() => ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: AppColors.background,
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.all(AppColors.grey1),
      fixedSize: WidgetStateProperty.all(Size(40.w, 40.w)),
      iconSize: WidgetStateProperty.all(24.w),
    ),
  ),
);
