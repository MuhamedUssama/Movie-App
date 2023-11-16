import 'package:flutter/material.dart';
import 'package:movie_app/ui/utils/app_colors.dart';


abstract class AppTheme{
  static  ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.primary,
  );
  static ThemeData darkTheme =  ThemeData();
}