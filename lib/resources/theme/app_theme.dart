import 'package:flutter/material.dart';
import 'package:school_management_system_admin/resources/theme/app_pallete.dart';

final AppTheme = ThemeData(
  primaryColor: AppPallete.primaryColor,
  scaffoldBackgroundColor: AppPallete.backgroundColor,
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  colorScheme: ColorScheme.light(
    primary: AppPallete.primaryColor,
    secondary: AppPallete.secondaryColor,
    tertiary: AppPallete.accentColor,
    surface: AppPallete.surfaceColor,
    background: AppPallete.backgroundColor,
    error: AppPallete.errorColor,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: AppPallete.containerColor,
    elevation: 0,
    iconTheme: IconThemeData(color: AppPallete.textPrimaryColor),
    titleTextStyle: TextStyle(
      color: AppPallete.textPrimaryColor,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
  ),
  textTheme: TextTheme(
    displayLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: AppPallete.primaryColor,
    ),
    displayMedium: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: AppPallete.primaryColor,
    ),
    displaySmall: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: AppPallete.primaryColor,
    ),
    headlineMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: AppPallete.textPrimaryColor,
    ),
    headlineSmall: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: AppPallete.textPrimaryColor,
    ),
    titleLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: AppPallete.textPrimaryColor,
    ),
    bodyLarge: TextStyle(fontSize: 16, color: AppPallete.textPrimaryColor),
    bodyMedium: TextStyle(fontSize: 14, color: AppPallete.textPrimaryColor),
    bodySmall: TextStyle(fontSize: 12, color: AppPallete.textSecondaryColor),
    labelLarge: TextStyle(
      color: AppPallete.primaryColor,
      fontWeight: FontWeight.w600,
    ),
  ),
  iconTheme: IconThemeData(color: AppPallete.textPrimaryColor, size: 20),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppPallete.primaryColor,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: AppPallete.primaryColor,
      side: BorderSide(color: AppPallete.primaryColor),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    ),
  ),
  cardTheme: CardThemeData(
    color: AppPallete.surfaceColor,
    elevation: 2,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppPallete.primaryColor,
      textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    ),
  ),
  tabBarTheme: TabBarThemeData(
    labelColor: AppPallete.primaryColor,
    unselectedLabelColor: AppPallete.textSecondaryColor,
    indicator: UnderlineTabIndicator(
      borderSide: BorderSide(color: AppPallete.accentColor, width: 3),
    ),
    labelStyle: const TextStyle(fontWeight: FontWeight.bold),
    unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppPallete.focusColor,
    contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: AppPallete.borderColor, width: 1.5),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: AppPallete.primaryColor, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: AppPallete.errorColor, width: 1.5),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: AppPallete.errorColor, width: 2),
    ),
    hintStyle: TextStyle(color: AppPallete.textSecondaryColor),
    labelStyle: TextStyle(color: AppPallete.primaryColor),
  ),
  dividerTheme: DividerThemeData(
    color: AppPallete.borderColor,
    thickness: 1,
    space: 1,
  ),
  chipTheme: ChipThemeData(
    backgroundColor: AppPallete.containerColor,
    disabledColor: AppPallete.textDisabledColor,
    selectedColor: AppPallete.primaryColor,
    secondarySelectedColor: AppPallete.primaryColor,
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    labelStyle: const TextStyle(color: Colors.white),
    secondaryLabelStyle: const TextStyle(color: AppPallete.textPrimaryColor),
    brightness: Brightness.dark,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: AppPallete.primaryColor,
    foregroundColor: AppPallete.textPrimaryColor,
    elevation: 4,
  ),
);
