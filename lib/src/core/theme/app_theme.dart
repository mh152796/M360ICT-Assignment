import 'package:flutter/material.dart';
import 'package:m_360_assignment/src/core/utils/app_colors.dart';

class AppTheme{
  static ThemeData appTheme = ThemeData(
    primaryColor: kPrimary,
    scaffoldBackgroundColor: kPrimary,
    appBarTheme: AppBarTheme(
      backgroundColor: kPrimary,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
     ),
  );

}