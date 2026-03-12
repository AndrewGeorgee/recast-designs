import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';

class GoldGradientText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final int? maxLines;
  final TextOverflow? overflow;

  const GoldGradientText({
    super.key,
    required this.text,
    required this.style,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => const LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [AppColors.goldGradientStart, AppColors.goldGradientEnd],
      ).createShader(bounds),
      child: Text(
        text,
        style: style.copyWith(color: Colors.white),
        maxLines: maxLines,
        overflow: overflow,
      ),
    );
  }
}
