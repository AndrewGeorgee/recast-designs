import 'package:flutter/material.dart';
import '../../../constants/app_strings.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_typography.dart';
import '../../../theme/responsive.dart';
import '../../../models/loyalty_entry.dart';
import '../../../shared/widgets/gold_gradient_text.dart';
import '../../../shared/widgets/gold_credits_badge.dart';
import '../../../shared/widgets/venue_thumbnail_box.dart';

class LoyaltyTransactionCard extends StatelessWidget {
  final LoyaltyEntry transaction;

  const LoyaltyTransactionCard({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: Responsive.h(72)),
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.w(14),
        vertical: Responsive.h(14),
      ),
      decoration: BoxDecoration(
        color: AppColors.loyaltyCardSurface,
        borderRadius: BorderRadius.circular(Responsive.sp(10)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          VenueThumbnailBox(
            imageUrl: transaction.venueThumbnailUrl,
            boxSize: 52,
            imageSize: 32,
            borderRadius: 6,
          ),
          SizedBox(width: Responsive.w(12)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.venueName,
                  style: AppTypography.transactionVenueName(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: Responsive.h(4)),
                Text(
                  _formatTransactionDate(transaction.date),
                  style: AppTypography.transactionDate(),
                ),
                SizedBox(height: Responsive.h(7)),
                GoldGradientText(
                  text:
                      '${transaction.spendAmountJD.toStringAsFixed(2)} ${AppStrings.jd} \u2022 ${transaction.pointsEarned} ${AppStrings.credits}',
                  style: AppTypography.transactionAmountGold(),
                ),
              ],
            ),
          ),
          SizedBox(width: Responsive.w(8)),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GoldCreditsBadge(
                label: '${transaction.runningPointsTotal} ${AppStrings.credits}',
              ),
              SizedBox(height: Responsive.h(8)),
              Icon(
                Icons.chevron_right_rounded,
                color: AppColors.textMuted,
                size: Responsive.sp(25),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatTransactionDate(DateTime date) {
    final months = AppStrings.monthNamesShort;
    return '${date.day.toString().padLeft(2, '0')} ${months[date.month - 1]}, ${date.year}';
  }
}
