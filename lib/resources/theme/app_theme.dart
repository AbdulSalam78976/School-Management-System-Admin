import 'package:flutter/material.dart';
import 'package:school_management_system_admin/resources/theme/app_pallete.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        primary: AppPalette.primaryColor,
        secondary: AppPalette.secondaryColor,
        surface: AppPalette.surfaceColor,
        background: Colors.white,
        error: AppPalette.errorColor,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Colors.black,
        onBackground: Colors.black,
      ),
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      cardTheme: CardThemeData(
        elevation: 2,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: Colors.white,
      ),
      // ... other light theme configurations
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      splashColor: Colors.transparent,
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        primary: AppPalette.primaryColor,
        secondary: AppPalette.secondaryColor,
        surface: AppPalette.surfaceColor,
        background: AppPalette.backgroundColor,
        error: AppPalette.errorColor,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: AppPalette.textPrimaryColor,
        onBackground: AppPalette.textPrimaryColor,
      ),
      scaffoldBackgroundColor: AppPalette.backgroundColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppPalette.containerColor,
        foregroundColor: AppPalette.textPrimaryColor,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppPalette.textPrimaryColor),
      ),
      cardTheme: CardThemeData(
        elevation: 2,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: AppPalette.surfaceColor,
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: AppPalette.textPrimaryColor,
        ),
        displayMedium: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: AppPalette.textPrimaryColor,
        ),
        titleLarge: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: AppPalette.textPrimaryColor,
        ),
        bodyLarge: TextStyle(fontSize: 16, color: AppPalette.textPrimaryColor),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: AppPalette.textSecondaryColor,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppPalette.primaryColor,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppPalette.primaryColor,
          side: const BorderSide(color: AppPalette.primaryColor),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppPalette.borderColor,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppPalette.primaryColor,
            width: 2,
          ),
        ),
        labelStyle: const TextStyle(color: AppPalette.textSecondaryColor),
        hintStyle: const TextStyle(color: AppPalette.textSecondaryColor),
      ),
      dividerTheme: const DividerThemeData(
        color: AppPalette.borderColor,
        thickness: 1,
        space: 1,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppPalette.primaryColor,
        foregroundColor: Colors.white,
        elevation: 4,
      ),
      chipTheme: ChipThemeData(
        backgroundColor: AppPalette.containerColor,
        disabledColor: AppPalette.textDisabledColor,
        selectedColor: AppPalette.primaryColor,
        secondarySelectedColor: AppPalette.primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        labelStyle: const TextStyle(color: Colors.white),
        secondaryLabelStyle: const TextStyle(
          color: AppPalette.textPrimaryColor,
        ),
        brightness: Brightness.dark,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
