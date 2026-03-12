import 'dart:math' as math;

import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/responsive.dart';

class CircleAvatarGroup extends StatelessWidget {
  final List<String> imageUrls;

  const CircleAvatarGroup({
    super.key,
    required this.imageUrls,
  });

  static const double _designSize = 30.0;
  static const double _designRadius = 10.0;
  static const double _designOverlapStep = 22.0;

  bool _isAssetPath(String path) => path.startsWith('assets/');

  @override
  Widget build(BuildContext context) {
    if (imageUrls.isEmpty) return const SizedBox.shrink();

    final size = Responsive.sp(_designSize);
    final radius = Responsive.sp(_designRadius);
    final step = Responsive.sp(_designOverlapStep);
    final totalWidth = size + (imageUrls.length - 1) * step;

    return SizedBox(
      width: totalWidth,
      height: size,
      child: Stack(
        children: List.generate(imageUrls.length, (index) {
          final reverseIndex = imageUrls.length - 1 - index;
          return Positioned(
            left: reverseIndex * step,
            child: _buildThumbnail(imageUrls[reverseIndex], size, radius),
          );
        }),
      ),
    );
  }

  Widget _buildThumbnail(String url, double size, double radius) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: AppColors.orderThumbnailBg,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(
          color: AppColors.orderThumbnailBorder,
          width: 1,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(math.max(0, radius - 1)),
        child: _isAssetPath(url)
            ? Image.asset(
                url,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) => _placeholder(size),
              )
            : Image.network(
                url,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) => _placeholder(size),
              ),
      ),
    );
  }

  Widget _placeholder(double size) => Container(
        color: AppColors.orderThumbnailBg,
        child: Icon(
          Icons.image,
          color: AppColors.textMuted,
          size: size * 0.4,
        ),
      );
}
