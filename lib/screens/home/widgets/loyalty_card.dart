import 'package:flutter/material.dart';
import '../../../constants/app_assets.dart';
import '../../../constants/app_strings.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_typography.dart';
import '../../../theme/responsive.dart';
import '../../../models/user.dart';
import '../../../widgets/circle_avatar_group.dart';
import '../../../widgets/tap_scale_wrapper.dart';

class LoyaltyCard extends StatefulWidget {
  final User user;
  final List<String> orderAvatarUrls;
  final VoidCallback? onMoreDetails;

  const LoyaltyCard({
    super.key,
    required this.user,
    required this.orderAvatarUrls,
    this.onMoreDetails,
  });

  @override
  State<LoyaltyCard> createState() => _LoyaltyCardState();
}

class _LoyaltyCardState extends State<LoyaltyCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _progressCtrl;
  late final Animation<double> _progressAnim;

  @override
  void initState() {
    super.initState();
    _progressCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _progressAnim = CurvedAnimation(
      parent: _progressCtrl,
      curve: Curves.easeOutCubic,
    );
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) _progressCtrl.forward();
    });
  }

  @override
  void dispose() {
    _progressCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Responsive.sp(19)),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(Responsive.sp(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppStrings.alterNow, style: AppTypography.brandLabel()),
              ColorFiltered(
                colorFilter: const ColorFilter.mode(
                  AppColors.textPrimary,
                  BlendMode.srcIn,
                ),
                child: Image.asset(
                  AppAssets.iconUserDefault,
                  width: Responsive.sp(19),
                  height: Responsive.sp(19),
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
          SizedBox(height: Responsive.h(2)),
          Text(AppStrings.loyaltyPoints, style: AppTypography.loyaltyPointsLabel()),
          SizedBox(height: Responsive.h(8)),
          ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (bounds) => AppColors.goldGradient.createShader(bounds),
            child: Text(
              _formatNumber(widget.user.loyaltyPoints),
              style: AppTypography.loyaltyPointsValue(),
            ),
          ),
          SizedBox(height: Responsive.h(12)),
          SizedBox(width: double.infinity, child: _buildProgressBar()),
          SizedBox(height: Responsive.h(16)),
          Row(
            children: [
              Text(
                AppStrings.totalOrders,
                style: AppTypography.totalOrdersLabel(),
              ),
              SizedBox(width: Responsive.w(4)),
              Text(
                '${widget.user.totalOrders}',
                style: AppTypography.totalOrdersCount(),
              ),
            ],
          ),
          SizedBox(height: Responsive.h(10)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CircleAvatarGroup(imageUrls: widget.orderAvatarUrls),
              const Spacer(),
              TapScaleWrapper(
                onTap: widget.onMoreDetails,
                child: Container(
                  width: Responsive.w(95),
                  height: Responsive.h(31),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(Responsive.sp(15)),
                    border: Border.all(
                      color: AppColors.textPrimary,
                      width: 1.5,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        AppStrings.moreDetails,
                        style: AppTypography.moreDetailsLabel(),
                      ),
                      SizedBox(width: Responsive.w(4)),
                      Icon(
                        Icons.arrow_forward,
                        color: AppColors.textPrimary,
                        size: Responsive.sp(12),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProgressBar() {
    const barHeight = 20.0;
    const radius = 12.0;

    final scaledBarHeight = Responsive.h(barHeight);
    final scaledRadius = Responsive.sp(radius);

    return LayoutBuilder(
      builder: (context, constraints) {
        final trackWidth = constraints.maxWidth;
        return AnimatedBuilder(
          animation: _progressAnim,
          builder: (context, child) {
            final progress =
                (widget.user.loyaltyProgress * _progressAnim.value).clamp(
                  0.0,
                  1.0,
                );
            final fillWidth = trackWidth * progress;
            return Container(
              width: trackWidth,
              height: scaledBarHeight,
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(scaledRadius),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(scaledRadius),
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    if (fillWidth > 0)
                      Container(
                        width: fillWidth,
                        height: scaledBarHeight,
                        decoration: BoxDecoration(
                          gradient: AppColors.goldGradient,
                          borderRadius: BorderRadius.circular(scaledRadius),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.progressBarShadow,
                              blurRadius: 4,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  String _formatNumber(int number) {
    final str = number.toString();
    final buffer = StringBuffer();
    for (var i = 0; i < str.length; i++) {
      if (i > 0 && (str.length - i) % 3 == 0) buffer.write(',');
      buffer.write(str[i]);
    }
    return buffer.toString();
  }
}
