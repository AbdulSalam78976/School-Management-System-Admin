import 'package:flutter/material.dart';

class AppPallete {
  // =================== THEME COLORS ===================

  /// Primary brand color - used for main actions, buttons, and key UI elements
  static const Color primaryColor = Color(0xFF2697FF); // Educational blue

  /// Secondary brand color - used for accents and complementary elements
  static const Color secondaryColor = Color(0xFF34A853); // Success green

  /// Accent color - used for highlighting selected items or important information
  static const Color accentColor = Color(0xFFFBBC04); // Attention yellow

  /// Overall app background
  static const Color backgroundColor = Color(
    0xFF15131c,
  ); // Dark blue-gray background

  /// Card background color - used for elevated surfaces
  static const Color surfaceColor = Color(0xFF21222D); // Dark surface

  /// Background color for sidebar or containers
  static const Color containerColor = Color(
    0xFF2D2F3E,
  ); // Medium dark blue-gray

  // =================== TEXT COLORS ===================

  /// Primary text color
  static const Color textPrimaryColor = Color(0xFFE8EAED); // Off-white

  /// Secondary text color (subtitles, less important text)
  static const Color textSecondaryColor = Color(0xFFAEAEAE); // Light gray

  /// Disabled text color
  static const Color textDisabledColor = Color(0xFF6C6C6C); // Dark gray

  // =================== STATE COLORS ===================

  /// Success color - used for successful actions, completions
  static const Color successColor = Color(0xFF34A853); // Green

  /// Warning color - used for warnings, pending actions
  static const Color warningColor = Color(0xFFFBBC04); // Yellow

  /// Error color - used for errors, destructive actions
  static const Color errorColor = Color(0xFFEA4335); // Red

  /// Info color - used for information, help
  static const Color infoColor = Color(0xFF4285F4); // Blue

  // =================== INTERACTION COLORS ===================

  /// Color for hover states
  static const Color hoverColor = Color(0xFF3C4043); // Dark gray

  /// Color for focus states
  static const Color focusColor = Color(
    0xFF2C2F3F,
  ); // Slightly lighter than background

  /// Color for pressed states
  static const Color pressedColor = Color(0xFF1C1E29); // Slightly darker

  /// Color for borders and dividers
  static const Color borderColor = Color(0xFF3C3F58); // Dark gray border

  // =================== SPACING ===================

  /// Default padding used throughout the app
  static const double defaultPadding = 16.0;

  /// Small padding for tighter spaces
  static const double smallPadding = 8.0;

  /// Large padding for more spacious layouts
  static const double largePadding = 24.0;
}
