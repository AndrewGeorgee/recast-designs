import 'package:flutter/material.dart';
import '../../../theme/responsive.dart';
import '../../../models/venue.dart';
import '../../venue_selection/widgets/venue_selection_card.dart';

class VenueGrid extends StatelessWidget {
  final List<Venue> venues;
  final ValueChanged<int>? onVenueSelected;
  final Animation<double>? entranceAnimation;

  const VenueGrid({
    super.key,
    required this.venues,
    this.onVenueSelected,
    this.entranceAnimation,
  });

  static const _baseHeight = 130.0;
  static const _spacing = 12.0;
  static const _totalDesignHeight = 257.0;

  Animation<double>? _staggerAnim(int index) {
    if (entranceAnimation == null) return null;
    final start = (index * 0.12).clamp(0.0, 1.0);
    final end = (start + 0.5).clamp(0.0, 1.0);
    return CurvedAnimation(
      parent: entranceAnimation!,
      curve: Interval(start, end, curve: Curves.easeOutCubic),
    );
  }

  double _cardHeight(Venue venue, double scaleFactor) =>
      Responsive.h(_baseHeight) * venue.cardHeightFactor * scaleFactor;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final spacing = Responsive.w(_spacing);
        final designHeight = Responsive.h(_totalDesignHeight);
        final scaleFactor = constraints.maxHeight.isFinite
            ? constraints.maxHeight / designHeight
            : 1.0;

        if (venues.isEmpty) return const SizedBox.shrink();

        final leftCols = <int>[];
        final rightCols = <int>[];
        var leftHeight = 0.0;
        var rightHeight = 0.0;

        for (var i = 0; i < venues.length; i++) {
          final h = _cardHeight(venues[i], scaleFactor);
          if (leftHeight <= rightHeight) {
            leftHeight += (leftCols.isNotEmpty ? spacing : 0) + h;
            leftCols.add(i);
          } else {
            rightHeight += (rightCols.isNotEmpty ? spacing : 0) + h;
            rightCols.add(i);
          }
        }

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (var i = 0; i < leftCols.length; i++) ...[
                    if (i > 0) SizedBox(height: spacing),
                    _buildCard(leftCols[i], scaleFactor),
                  ],
                ],
              ),
            ),
            SizedBox(width: spacing),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (var i = 0; i < rightCols.length; i++) ...[
                    if (i > 0) SizedBox(height: spacing),
                    _buildCard(rightCols[i], scaleFactor),
                  ],
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildCard(int index, double scaleFactor) {
    if (index >= venues.length) return const SizedBox.shrink();
    final venue = venues[index];
    return VenueSelectionCard(
      name: venue.name,
      category: venue.category,
      imagePath: venue.imageUrl,
      heightFactor: venue.cardHeightFactor * scaleFactor,
      brandName: venue.brandName,
      onTap: onVenueSelected != null ? () => onVenueSelected!(index) : null,
      entranceAnimation: _staggerAnim(index),
    );
  }
}
