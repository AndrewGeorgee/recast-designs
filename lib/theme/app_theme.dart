import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_typography.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.goldGradientStart,
        surface: AppColors.cardBackground,
      ),
      cardTheme: CardThemeData(
        color: AppColors.cardBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 0,
      ),
      textTheme: _satoshiTextTheme,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.background,
        selectedItemColor: AppColors.goldGradientStart,
        unselectedItemColor: AppColors.textMuted,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),
    );
  }

  static final TextTheme _satoshiTextTheme = TextTheme(
    displayLarge: AppTypography.raw(size: 57, weight: FontWeight.w300),
    displayMedium: AppTypography.raw(size: 45, weight: FontWeight.w300),
    displaySmall: AppTypography.raw(size: 36, weight: FontWeight.w400),

    headlineLarge: AppTypography.raw(
      size: 28,
      weight: FontWeight.w700,
      color: AppColors.textPrimary,
    ),
    headlineMedium: AppTypography.raw(
      size: 22,
      weight: FontWeight.w700,
      color: AppColors.textPrimary,
    ),
    headlineSmall: AppTypography.raw(
      size: 18,
      weight: FontWeight.w700,
      color: AppColors.textPrimary,
    ),

    titleLarge: AppTypography.raw(
      size: 16,
      weight: FontWeight.w700,
      color: AppColors.textPrimary,
    ),
    titleMedium: AppTypography.raw(
      size: 14,
      weight: FontWeight.w600,
      color: AppColors.textPrimary,
    ),
    titleSmall: AppTypography.raw(
      size: 12,
      weight: FontWeight.w600,
      color: AppColors.textPrimary,
    ),

    bodyLarge: AppTypography.raw(
      size: 16,
      weight: FontWeight.w400,
      color: AppColors.textPrimary,
    ),
    bodyMedium: AppTypography.raw(
      size: 14,
      weight: FontWeight.w400,
      color: AppColors.textSecondary,
    ),
    bodySmall: AppTypography.raw(
      size: 12,
      weight: FontWeight.w400,
      color: AppColors.textMuted,
    ),

    labelLarge: AppTypography.raw(
      size: 13,
      weight: FontWeight.w600,
      color: AppColors.textPrimary,
    ),
    labelMedium: AppTypography.raw(
      size: 11,
      weight: FontWeight.w600,
      color: AppColors.textSecondary,
    ),
    labelSmall: AppTypography.raw(
      size: 10,
      weight: FontWeight.w500,
      color: AppColors.textMuted,
      letterSpacingFactor: 0.08,
    ),
  );
}
