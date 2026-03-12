import 'package:flutter/material.dart';
import '../../../constants/app_strings.dart';
import '../../../theme/app_typography.dart';
import '../../../theme/responsive.dart';
import '../../../models/user.dart';
import '../../../shared/widgets/user_avatar_ring.dart';

class ProfileIdentityHeader extends StatelessWidget {
  final User user;
  final VoidCallback? onEditTapped;

  const ProfileIdentityHeader({
    super.key,
    required this.user,
    this.onEditTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        UserAvatarRing(imageUrl: user.avatarUrl, radius: 24),
        SizedBox(width: Responsive.w(14)),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(user.fullName, style: AppTypography.profileUserName()),
              SizedBox(height: Responsive.h(5)),
              Text(user.phone, style: AppTypography.profilePhoneNumber()),
            ],
          ),
        ),
        GestureDetector(
          onTap: onEditTapped,
          behavior: HitTestBehavior.opaque,
          child: Text(AppStrings.edit, style: AppTypography.profileEditLabel()),
        ),
      ],
    );
  }
}
