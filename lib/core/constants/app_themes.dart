import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightBackground,
    primaryColor: AppColors.primary,
    cardColor: const Color.fromARGB(255, 255, 255, 255),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 16,
        color: AppColors.lightTextPrimary,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 14,
        color: AppColors.lightTextSecondary,
      ),
      titleLarge: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    iconTheme: const IconThemeData(color: AppColors.lightTextPrimary),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkBackground,
    primaryColor: AppColors.primary,
    cardColor: AppColors.darkBox,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 16,
        color: AppColors.darkTextPrimary,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 14,
        color: AppColors.darkTextSecondary,
      ),
      titleLarge: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    iconTheme: const IconThemeData(color: AppColors.darkTextPrimary),
  );
}
