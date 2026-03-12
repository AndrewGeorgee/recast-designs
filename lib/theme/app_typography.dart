import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'responsive.dart';

abstract class AppTypography {
  static const String _family = 'Satoshi';

  static TextStyle raw({
    required double size,
    required FontWeight weight,
    Color color = AppColors.textPrimary,
    double height = 1.0,
    double? letterSpacingFactor,
  }) {
    return TextStyle(
      fontFamily: _family,
      fontSize: size,
      fontWeight: weight,
      color: color,
      height: height,
      letterSpacing:
          letterSpacingFactor != null ? size * letterSpacingFactor : null,
    );
  }

  static TextStyle screenNavLabel() => TextStyle(
        fontFamily: _family,
        color: AppColors.textSecondary,
        fontSize: Responsive.sp(13),
        fontWeight: FontWeight.w500,
        height: 1.0,
        letterSpacing: Responsive.sp(13) * -0.03,
      );

  static TextStyle sectionHeading() => TextStyle(
        fontFamily: _family,
        color: AppColors.sectionTitleColor,
        fontSize: Responsive.sp(13),
        fontWeight: FontWeight.w700,
        height: 1.0,
        letterSpacing: Responsive.sp(13) * -0.05,
      );

  static TextStyle sectionLabel() => TextStyle(
        fontFamily: _family,
        color: AppColors.sectionTitleColor,
        fontSize: Responsive.sp(11),
        fontWeight: FontWeight.w600,
        height: 1.0,
        letterSpacing: Responsive.sp(11) * 0.08,
      );

  static TextStyle greeting() => TextStyle(
        fontFamily: _family,
        fontWeight: FontWeight.w400,
        fontSize: Responsive.sp(10),
        height: 1.0,
        letterSpacing: Responsive.sp(10) * -0.03,
        color: AppColors.greetingText,
      );

  static TextStyle userName() => TextStyle(
        fontFamily: _family,
        fontWeight: FontWeight.w700,
        fontSize: Responsive.sp(26),
        height: 1.0,
        letterSpacing: Responsive.sp(26) * -0.05,
        color: Colors.white,
      );

  static TextStyle brandLabel() => TextStyle(
        fontFamily: _family,
        fontWeight: FontWeight.w500,
        fontSize: Responsive.sp(12),
        height: 1.3,
        letterSpacing: Responsive.sp(12) * -0.03,
        color: AppColors.brandLabel,
      );

  static TextStyle loyaltyPointsValue() => TextStyle(
        fontFamily: _family,
        fontWeight: FontWeight.w700,
        fontSize: Responsive.sp(22),
        height: 1.0,
        letterSpacing: Responsive.sp(22) * -0.05,
        color: Colors.white,
      );

  static TextStyle loyaltyPointsLabel() => TextStyle(
        fontFamily: _family,
        fontWeight: FontWeight.w700,
        fontSize: Responsive.sp(13),
        height: 1.0,
        letterSpacing: Responsive.sp(13) * -0.05,
        color: AppColors.loyaltyTitle,
      );

  static TextStyle totalOrdersLabel() => TextStyle(
        fontFamily: _family,
        fontWeight: FontWeight.w500,
        fontSize: Responsive.sp(13),
        height: 1.3,
        letterSpacing: Responsive.sp(13) * -0.03,
        color: AppColors.totalOrdersLabel,
      );

  static TextStyle totalOrdersCount() => TextStyle(
        fontFamily: _family,
        fontWeight: FontWeight.w700,
        fontSize: Responsive.sp(13),
        height: 1.3,
        letterSpacing: Responsive.sp(13) * -0.03,
        color: AppColors.totalOrdersCount,
      );

  static TextStyle moreDetailsLabel() => TextStyle(
        fontFamily: _family,
        fontWeight: FontWeight.w500,
        fontSize: Responsive.sp(10),
        height: 1.3,
        letterSpacing: Responsive.sp(10) * -0.03,
        color: AppColors.textPrimary,
      );

  static TextStyle profileUserName() => TextStyle(
        fontFamily: _family,
        color: AppColors.textPrimary,
        fontSize: Responsive.sp(17),
        fontWeight: FontWeight.w700,
        height: 1.0,
        letterSpacing: Responsive.sp(17) * -0.05,
      );

  static TextStyle profilePhoneNumber() => TextStyle(
        fontFamily: _family,
        color: AppColors.goldGradientStart,
        fontSize: Responsive.sp(12),
        fontWeight: FontWeight.w500,
        letterSpacing: 0.2,
      );

  static TextStyle profileEditLabel() => TextStyle(
        fontFamily: _family,
        color: AppColors.goldGradientStart,
        fontSize: Responsive.sp(11),
        fontWeight: FontWeight.w700,
        height: 1.0,
        letterSpacing: Responsive.sp(9) * 0.01,
      );

  static TextStyle transactionVenueName() => TextStyle(
        fontFamily: _family,
        color: AppColors.textPrimary,
        fontSize: Responsive.sp(13),
        fontWeight: FontWeight.w700,
        height: 1.0,
        letterSpacing: Responsive.sp(13) * -0.05,
      );

  static TextStyle transactionDate() => TextStyle(
        fontFamily: _family,
        color: const Color(0x80FFFFFF),
        fontSize: Responsive.sp(10),
        fontWeight: FontWeight.w500,
        height: 1.0,
        letterSpacing: Responsive.sp(10) * -0.03,
      );

  static TextStyle transactionAmountGold() => TextStyle(
        fontFamily: _family,
        fontSize: Responsive.sp(11),
        fontWeight: FontWeight.w700,
        height: 1.0,
        letterSpacing: Responsive.sp(11) * -0.05,
        color: Colors.white,
      );

  static TextStyle creditsBadgeLabel() => TextStyle(
        fontFamily: _family,
        color: AppColors.goldDark,
        fontSize: Responsive.sp(11),
        fontWeight: FontWeight.w700,
      );

  static TextStyle venueCardName() => TextStyle(
        fontFamily: _family,
        color: AppColors.textPrimary,
        fontSize: Responsive.sp(12),
        fontWeight: FontWeight.w700,
        height: 1.2,
        letterSpacing: Responsive.sp(12) * -0.05,
      );

  static TextStyle venueCardCategory() => TextStyle(
        fontFamily: _family,
        color: AppColors.white80,
        fontSize: Responsive.sp(10),
        fontWeight: FontWeight.w700,
        height: 1.0,
        letterSpacing: Responsive.sp(6) * -0.05,
      );
}
