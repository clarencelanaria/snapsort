import 'package:flutter/material.dart';

/// All the colors SnapSort uses, defined once so the whole app stays consistent.
class AppColors {
  // A private constructor stops anyone from creating an AppColors object;
  // this class is only a container for constants.
  AppColors._();

  static const Color background = Color(0xFF1B1D1F); // dark charcoal
  static const Color surface = Color(0xFF26292D); // cards, nav bar
  static const Color accent = Color(0xFFA3E635); // subtle lime green
  static const Color onAccent = Color(0xFF1B1D1F); // text/icons on lime
  static const Color textPrimary = Color(0xFFECEEF0);
  static const Color textSecondary = Color(0xFF9BA1A8);
}

/// Builds the app-wide theme. MaterialApp will receive this in a later step.
ThemeData buildAppTheme() {
  const colorScheme = ColorScheme.dark(
    primary: AppColors.accent,
    onPrimary: AppColors.onAccent,
    surface: AppColors.surface,
    onSurface: AppColors.textPrimary,
  );

  return ThemeData(
    useMaterial3: true,
    colorScheme: colorScheme,
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.background,
      foregroundColor: AppColors.textPrimary,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
    ),
    cardTheme: CardThemeData(
      color: AppColors.surface,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: AppColors.surface,
      indicatorColor: AppColors.accent.withValues(alpha: 0.18),
      iconTheme: WidgetStateProperty.resolveWith((states) {
        final selected = states.contains(WidgetState.selected);
        return IconThemeData(
          color: selected ? AppColors.accent : AppColors.textSecondary,
        );
      }),
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        final selected = states.contains(WidgetState.selected);
        return TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: selected ? AppColors.accent : AppColors.textSecondary,
        );
      }),
    ),
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        height: 1.2,
        color: AppColors.textPrimary,
      ),
      titleMedium: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      ),
      bodyMedium: TextStyle(
        fontSize: 15,
        height: 1.4,
        color: AppColors.textSecondary,
      ),
    ),
  );
}
