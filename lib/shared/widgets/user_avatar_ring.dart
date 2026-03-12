import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/responsive.dart';

class UserAvatarRing extends StatelessWidget {
  final String imageUrl;
  final double radius;

  const UserAvatarRing({
    super.key,
    required this.imageUrl,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    final scaledRadius = Responsive.sp(radius);

    return Container(
      width: scaledRadius * 2 + 3,
      height: scaledRadius * 2 + 3,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.goldGradientStart, AppColors.goldGradientEnd],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(1.5),
        child: CircleAvatar(
          radius: scaledRadius,
          backgroundImage: imageUrl.startsWith('assets/')
              ? AssetImage(imageUrl)
              : NetworkImage(imageUrl) as ImageProvider,
          backgroundColor: AppColors.cardSurface,
        ),
      ),
    );
  }
}
