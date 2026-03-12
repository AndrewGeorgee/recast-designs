import 'package:flutter/material.dart';
import '../../../constants/app_assets.dart';
import '../../../constants/app_strings.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_typography.dart';
import '../../../theme/responsive.dart';
import '../../../widgets/tap_scale_wrapper.dart';

class WelcomeHeader extends StatelessWidget {
  final String fullName;
  final VoidCallback? onProfileTap;

  const WelcomeHeader({
    super.key,
    required this.fullName,
    this.onProfileTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.welcomeBack,
              style: AppTypography.greeting(),
            ),
            SizedBox(height: Responsive.h(4)),
            ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (bounds) => AppColors.goldGradient.createShader(bounds),
              child: Text(
                fullName,
                style: AppTypography.userName(),
              ),
            ),
          ],
        ),
        TapScaleWrapper(
          onTap: onProfileTap,
          child: Container(
            width: Responsive.sp(35),
            height: Responsive.sp(35),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.profileButtonBg,
              border: Border.all(
                color: AppColors.profileButtonBorder,
                width: 1.5,
              ),
            ),
            child: Center(
              child: ColorFiltered(
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
            ),
          ),
        ),
      ],
    );
  }
}
