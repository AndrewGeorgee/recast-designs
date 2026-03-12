import 'package:flutter/material.dart';
import '../../constants/app_strings.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_typography.dart';
import '../../theme/responsive.dart';
import '../../data/mock_data.dart';
import '../venue_selection/venue_selection_screen.dart';
import 'widgets/welcome_header.dart';
import 'widgets/loyalty_card.dart';
import 'widgets/venue_grid.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback? onProfileTap;

  const HomeScreen({super.key, this.onProfileTap});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _headerAnim;
  late final Animation<double> _cardAnim;
  late final Animation<double> _headingAnim;
  late final Animation<double> _grid;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _headerAnim = CurvedAnimation(
      parent: _ctrl,
      curve: const Interval(0.0, 0.35, curve: Curves.easeOutCubic),
    );
    _cardAnim = CurvedAnimation(
      parent: _ctrl,
      curve: const Interval(0.10, 0.50, curve: Curves.easeOutCubic),
    );
    _headingAnim = CurvedAnimation(
      parent: _ctrl,
      curve: const Interval(0.25, 0.55, curve: Curves.easeOutCubic),
    );
    _grid = CurvedAnimation(
      parent: _ctrl,
      curve: const Interval(0.35, 1.0, curve: Curves.easeOutCubic),
    );

    _ctrl.forward();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = mockUser;
    final venues = mockVenues;
    final orderThumbnails = mockOrderThumbnails;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        bottom: false,
        right: false,
        left: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: Responsive.h(12)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Responsive.w(16)),
              child: _fadeSlide(
                animation: _headerAnim,
                child: WelcomeHeader(
                  fullName: user.fullName,
                  onProfileTap: widget.onProfileTap,
                ),
              ),
            ),
            SizedBox(height: Responsive.h(22)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Responsive.w(16)),
              child: _fadeSlide(
                animation: _cardAnim,
                child: LoyaltyCard(
                  user: user,
                  orderAvatarUrls: orderThumbnails,
                ),
              ),
            ),
            SizedBox(height: Responsive.h(24)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Responsive.w(16)),
              child: _fadeSlide(
                animation: _headingAnim,
                child: Text(AppStrings.venueSelection, style: AppTypography.sectionHeading()),
              ),
            ),
            SizedBox(height: Responsive.h(26)),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Responsive.w(5)),
                child: VenueGrid(
                  venues: venues,
                  onVenueSelected: (_) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => VenueSelectionScreen(venues: venues),
                      ),
                    );
                  },
                  entranceAnimation: _grid,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _fadeSlide({
    required Animation<double> animation,
    required Widget child,
  }) {
    return FadeTransition(
      opacity: animation,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.15),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      ),
    );
  }
}
