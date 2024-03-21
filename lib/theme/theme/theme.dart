import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stocks/theme/theme/const.dart';

final theme = ThemeData(
  primaryColor: c300,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: c100,
  appBarTheme: const AppBarTheme(
    backgroundColor: c200,
  ),
  textTheme: TextTheme(
    displayLarge: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 36.sp,
      fontWeight: FontWeight.w600,
    ),
    displayMedium: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 32.sp,
      fontWeight: FontWeight.w700,
    ),
    displaySmall: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 18.sp,
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
    ),
    bodySmall: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
    ),
  ),
);
