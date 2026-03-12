import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/responsive.dart';

class VenueThumbnailBox extends StatelessWidget {
  final String imageUrl;
  final double boxSize;
  final double? imageSize;
  final double borderRadius;

  const VenueThumbnailBox({
    super.key,
    required this.imageUrl,
    required this.boxSize,
    this.imageSize,
    this.borderRadius = 6.0,
  });

  @override
  Widget build(BuildContext context) {
    final resolvedImageSize = imageSize ?? boxSize * 0.6;
    final scaledBox = Responsive.sp(boxSize);
    final scaledImage = Responsive.sp(resolvedImageSize);
    final scaledRadius = Responsive.sp(borderRadius);

    return ClipRRect(
      borderRadius: BorderRadius.circular(scaledRadius),
      child: Container(
        width: scaledBox,
        height: scaledBox,
        color: Colors.black,
        alignment: Alignment.center,
        child: imageUrl.startsWith('assets/')
            ? Image.asset(
                imageUrl,
                width: scaledImage,
                height: scaledImage,
                fit: BoxFit.contain,
                errorBuilder: (_, _, _) =>
                    _VenueThumbnailPlaceholder(size: scaledImage),
              )
            : Image.network(
                imageUrl,
                width: scaledImage,
                height: scaledImage,
                fit: BoxFit.contain,
                errorBuilder: (_, _, _) =>
                    _VenueThumbnailPlaceholder(size: scaledImage),
              ),
      ),
    );
  }
}

class _VenueThumbnailPlaceholder extends StatelessWidget {
  final double size;
  const _VenueThumbnailPlaceholder({required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      color: AppColors.cardSurface,
      child: Icon(
        Icons.storefront_outlined,
        color: AppColors.textMuted,
        size: Responsive.sp(18),
      ),
    );
  }
}
