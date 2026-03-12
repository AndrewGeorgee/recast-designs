import 'package:flutter/material.dart';
import '../../constants/app_strings.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_typography.dart';
import '../../theme/responsive.dart';
import '../../data/mock_data.dart';
import 'widgets/profile_identity_header.dart';
import 'widgets/loyalty_transaction_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = mockUser;
    final history = mockLoyaltyHistory;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Responsive.w(20)),
                child: Column(
                  children: [
                    SizedBox(height: Responsive.h(8)),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          behavior: HitTestBehavior.opaque,
                          child: Padding(
                            padding: EdgeInsets.only(
                              right: Responsive.w(12),
                              top: Responsive.sp(4),
                              bottom: Responsive.sp(4),
                            ),
                            child: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: AppColors.textPrimary,
                              size: Responsive.sp(16),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(AppStrings.yourProfile, style: AppTypography.screenNavLabel()),
                        ),
                        GestureDetector(
                          onTap: () {},
                          behavior: HitTestBehavior.opaque,
                          child: Padding(
                            padding: EdgeInsets.all(Responsive.sp(4)),
                            child: Icon(
                              Icons.settings_outlined,
                              color: AppColors.textSecondary.withOpacity(0.71),
                              size: Responsive.sp(20),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Responsive.h(16)),
                    ProfileIdentityHeader(user: user),
                    SizedBox(height: Responsive.h(24)),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(AppStrings.loyaltyHistory, style: AppTypography.sectionLabel()),
                    ),
                    SizedBox(height: Responsive.h(14)),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: Responsive.w(20)),
              sliver: SliverList.separated(
                itemCount: history.length,
                separatorBuilder: (_, _) => SizedBox(height: Responsive.h(10)),
                itemBuilder: (context, index) {
                  return LoyaltyTransactionCard(transaction: history[index]);
                },
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: Responsive.h(32)),
            ),
          ],
        ),
      ),
    );
  }
}
