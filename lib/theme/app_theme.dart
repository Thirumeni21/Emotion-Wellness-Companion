import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryBlue = Color(0xFF3F95EF);
  static const Color primaryGreen = Color(0xFF40D2BD);
  static const Color primaryPink = Color(0xFFEA7DB4);
  static const Color primaryPurple = Color(0xFFBB80FF);
  static const Color lightBackground = Color(0xFFF5F8FB);
  static const Color happyGreen = Color(0xFF4CAF50);
  static const Color okayYellow = Color(0xFFFFC107);
  static const Color sadBlue = Color(0xFF5C9CE6);
  static const Color textDark = Color(0xFF333333);
  static const Color textLight = Color(0xFF6E7985);
}

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primaryBlue,
    scaffoldBackgroundColor: AppColors.lightBackground,
    fontFamily: 'Poppins',
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 24.0, 
        fontWeight: FontWeight.bold,
        color: AppColors.textDark,
      ),
      headlineMedium: TextStyle(
        fontSize: 20.0, 
        fontWeight: FontWeight.bold,
        color: AppColors.textDark,
      ),
      titleLarge: TextStyle(
        fontSize: 18.0, 
        fontWeight: FontWeight.w600,
        color: AppColors.textDark,
      ),
      bodyLarge: TextStyle(
        fontSize: 16.0,
        color: AppColors.textDark,
      ),
      bodyMedium: TextStyle(
        fontSize: 14.0,
        color: AppColors.textLight,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryBlue,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
  );
}
