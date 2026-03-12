import 'package:flutter/material.dart';

abstract class AppColors {
  static const LinearGradient goldGradient = LinearGradient(
    begin: Alignment(-1, 0.02),
    end: Alignment(1, -0.02),
    colors: [goldGradientStart, goldGradientEnd],
    stops: [0.0025, 0.5332],
  );

  static const Color background = Color(0xFF000000);
  static const Color cardBackground = Color(0xFF1A1A1A);
  static const Color cardSurface = Color(0xFF222222);

  static const Color greetingText = Color(0x99FFFFFF);
  static const Color brandLabel = Color(0x80FFFFFF);
  static const Color loyaltyTitle = Color(0xFFFFFFFF);
  static const Color totalOrdersLabel = Color(0x91FFFFFF);
  static const Color totalOrdersCount = Color(0xFFEDC692);
  static const Color white80 = Color(0xCCFFFFFF);
  static const Color venueSelectionTitle = Color(0xD1FFFFFF);
  static const Color sectionTitleColor = Color(0xD1FFFFFF);

  static const Color goldGradientStart = Color(0xFFE4B679);
  static const Color goldGradientEnd = Color(0xFFFEE5C4);

  static const Color progressBarShadow = Color(0x4DF0CB9A);

  static const Color profileButtonBg = Color(0x1AFFFFFF);
  static const Color profileButtonBorder = Color(0x4DFFFFFF);

  static const Color orderThumbnailBg = Color(0xFFD9D9D9);
  static const Color orderThumbnailBorder = Color(0xFF000000);

  static const Color venueCardOverlay = Color(0x0DFFFFFF);
  static const Color venueSelectionOverlay = Color(0x33000000);
  static const Color arrowButtonBg = Color(0x66000000);
  static const Color arrowButtonBorder = Color(0x66FFFFFF);

  static const Color loyaltyCardSurface = Color(0xFF2A2A2A);

  static const Color gold = Color(0xFFC9A96E);
  static const Color goldLight = Color(0xFFE8D5A8);
  static const Color goldDark = Color(0xFF3D3420);
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFAAAAAA);
  static const Color textMuted = Color(0xFF777777);
}
