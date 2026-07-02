import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData getTheme() {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.backgroundWhite,
      primaryColor: AppColors.primaryGreen,
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: AppColors.textDark),
        bodyMedium: TextStyle(color: AppColors.textDark),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.backgroundWhite,
        foregroundColor: AppColors.textDark,
        elevation: 0,
      ),
      useMaterial3: true,
    );
  }
}
