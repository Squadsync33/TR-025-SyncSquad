import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF0F4CDB); // Deep blue from screenshots
  static const Color backgroundColor = Color(0xFFF7F8FC);
  static const Color cardColor = Colors.white;
  static const Color textPrimaryColor = Color(0xFF1E293B);
  static const Color textSecondaryColor = Color(0xFF64748B);
  
  static const Color dangerColor = Color(0xFFEF4444);
  static const Color warningColor = Color(0xFFF59E0B);
  static const Color successColor = Color(0xFF10B981);
  static const Color dangerBgColor = Color(0xFFFEE2E2);
  static const Color warningBgColor = Color(0xFFFEF3C7);
  static const Color successBgColor = Color(0xFFD1FAE5);

  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: backgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(color: primaryColor),
        titleTextStyle: TextStyle(
          color: textPrimaryColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: primaryColor,
        unselectedItemColor: textSecondaryColor,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(color: textPrimaryColor, fontSize: 32, fontWeight: FontWeight.bold),
        headlineMedium: TextStyle(color: textPrimaryColor, fontSize: 24, fontWeight: FontWeight.bold),
        titleLarge: TextStyle(color: textPrimaryColor, fontSize: 20, fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(color: textSecondaryColor, fontSize: 16),
        bodyMedium: TextStyle(color: textSecondaryColor, fontSize: 14),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    );
  }
}
