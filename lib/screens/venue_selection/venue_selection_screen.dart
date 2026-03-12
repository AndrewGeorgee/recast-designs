import 'package:flutter/material.dart';
import '../../constants/app_strings.dart';
import '../../models/venue.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_typography.dart';
import '../../theme/responsive.dart';
import '../home/widgets/venue_grid.dart';

class VenueSelectionScreen extends StatefulWidget {
  final List<Venue> venues;

  const VenueSelectionScreen({super.key, required this.venues});

  @override
  State<VenueSelectionScreen> createState() => _VenueSelectionScreenState();
}

class _VenueSelectionScreenState extends State<VenueSelectionScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _anim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );
    _anim = CurvedAnimation(
      parent: _ctrl,
      curve: Curves.easeOutCubic,
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
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.textPrimary,
            size: Responsive.sp(18),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(AppStrings.venueSelection, style: AppTypography.sectionHeading()),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: Responsive.h(16)),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Responsive.w(20)),
                child: VenueGrid(
                  venues: widget.venues,
                  entranceAnimation: _anim,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
