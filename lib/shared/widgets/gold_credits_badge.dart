import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_typography.dart';
import '../../theme/responsive.dart';

class GoldCreditsBadge extends StatelessWidget {
  final String label;

  const GoldCreditsBadge({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.w(15),
        vertical: Responsive.h(8),
      ),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [AppColors.goldGradientStart, AppColors.goldGradientEnd],
        ),
        borderRadius: BorderRadius.circular(Responsive.sp(10)),
      ),
      child: Text(label, style: AppTypography.creditsBadgeLabel()),
    );
  }
}
