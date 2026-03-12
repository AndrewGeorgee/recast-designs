import 'dart:ui';

import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_typography.dart';
import '../../../theme/responsive.dart';
import '../../../widgets/tap_scale_wrapper.dart';

class VenueSelectionCard extends StatelessWidget {
  final String name;
  final String category;
  final String imagePath;
  final double heightFactor;
  final String? brandName;
  final VoidCallback? onTap;
  final Animation<double>? entranceAnimation;

  const VenueSelectionCard({
    super.key,
    required this.name,
    required this.category,
    required this.imagePath,
    this.heightFactor = 1.0,
    this.brandName,
    this.onTap,
    this.entranceAnimation,
  });

  static const double _baseCardHeight = 130.0;
  static const double _cardRadius = 16.0;
  static const double _textStripHeight = 58.0;
  static const double _stripBlurSigma = 4.0;

  bool get _isAsset => imagePath.startsWith('assets/');

  Widget _rawImage() => _isAsset
      ? Image.asset(imagePath, fit: BoxFit.cover,
          errorBuilder: (_, _, _) => _placeholder())
      : Image.network(imagePath, fit: BoxFit.cover,
          errorBuilder: (_, _, _) => _placeholder());

  @override
  Widget build(BuildContext context) {
    final height = Responsive.h(_baseCardHeight) * heightFactor;
    final radius = Responsive.sp(_cardRadius);
    final stripHeight = Responsive.h(_textStripHeight);

    Widget card = TapScaleWrapper(
      onTap: onTap,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.35),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          fit: StackFit.expand,
          children: [
            _rawImage(),

            ShaderMask(
              blendMode: BlendMode.dstIn,
              shaderCallback: (bounds) => const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0, 0.35, 0.65, 1.0],
                colors: [
                  Colors.transparent,
                  Color(0x33FFFFFF),
                  Color(0x99FFFFFF),
                  Colors.white,
                ],
              ).createShader(bounds),
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(
                  sigmaX: 10,
                  sigmaY: 10,
                  tileMode: TileMode.clamp,
                ),
                child: _rawImage(),
              ),
            ),

            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(radius),
                  bottomRight: Radius.circular(radius),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: _stripBlurSigma,
                    sigmaY: _stripBlurSigma,
                  ),
                  child: SizedBox(
                    height: stripHeight,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Responsive.w(12),
                        vertical: Responsive.h(8),
                      ),
                      child: _cardOverlay(),
                    ),
                  ),
                ),
              ),
            ),

            if (brandName != null && brandName!.isNotEmpty)
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: Responsive.w(12),
                    vertical: Responsive.h(10),
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withValues(alpha: 0.55),
                        Colors.transparent,
                      ],
                    ),
                  ),
                  child: Text(
                    brandName!.toUpperCase(),
                    style: AppTypography.raw(
                      size: Responsive.sp(10),
                      weight: FontWeight.w700,
                      letterSpacingFactor: 0.08,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        ),
      ),
    );

    if (entranceAnimation != null) {
      card = FadeTransition(
        opacity: entranceAnimation!,
        child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 0.08),
            end: Offset.zero,
          ).animate(entranceAnimation!),
          child: card,
        ),
      );
    }

    return card;
  }

  Widget _cardOverlay() => Row(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              category,
              style: AppTypography.venueCardCategory(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: Responsive.h(2)),
            ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (bounds) =>
                  AppColors.goldGradient.createShader(bounds),
              child: Text(
                name,
                style: AppTypography.venueCardName(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
      SizedBox(width: Responsive.w(8)),
      _arrowBtn(),
    ],
  );

  Widget _arrowBtn() {
    const designSize = 32.0;
    final size = Responsive.sp(designSize);
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.50),
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.30),
          width: 0.5,
        ),
      ),
      child: Icon(
        Icons.arrow_forward_rounded,
        color: AppColors.goldGradientStart,
        size: Responsive.sp(13),
      ),
    );
  }

  Widget _placeholder() => Container(
    color: AppColors.cardSurface,
    child: Icon(
      Icons.image,
      color: AppColors.textMuted,
      size: Responsive.sp(40),
    ),
  );
}
