import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recast_designs_task/screens/venue_selection/widgets/venue_selection_card.dart';
import 'package:recast_designs_task/widgets/tap_scale_wrapper.dart';
import '../../helpers/test_helpers.dart';

void main() {
  group('VenueSelectionCard', () {
    testWidgets('displays venue name', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const VenueSelectionCard(
            name: 'Ceano',
            category: 'Nikkei',
            imagePath: 'assets/images/ceano_venue_thumbnail.png',
          ),
        ),
      );
      await tester.pump();

      expect(find.text('Ceano'), findsOneWidget);
    });

    testWidgets('displays category', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const VenueSelectionCard(
            name: 'Ceano',
            category: 'Nikkei',
            imagePath: 'assets/images/ceano_venue_thumbnail.png',
          ),
        ),
      );
      await tester.pump();

      expect(find.text('Nikkei'), findsOneWidget);
    });

    testWidgets('shows brand name when provided', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const VenueSelectionCard(
            name: 'Nobiko',
            category: 'Restaurant',
            imagePath: 'assets/images/nobiko_venue_thumbnail.png',
            brandName: 'Nobiko Group',
          ),
        ),
      );
      await tester.pump();

      // Brand name is uppercased
      expect(find.text('NOBIKO GROUP'), findsOneWidget);
    });

    testWidgets('does not show brand name when null', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const VenueSelectionCard(
            name: 'Ceano',
            category: 'Nikkei',
            imagePath: 'assets/images/ceano_venue_thumbnail.png',
          ),
        ),
      );
      await tester.pump();

      // No brand name text should appear
      expect(find.text('CEANO'), findsNothing);
    });

    testWidgets('shows arrow icon button', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const VenueSelectionCard(
            name: 'Ceano',
            category: 'Nikkei',
            imagePath: 'assets/images/ceano_venue_thumbnail.png',
          ),
        ),
      );
      await tester.pump();

      expect(find.byIcon(Icons.arrow_forward_rounded), findsOneWidget);
    });

    testWidgets('wraps in TapScaleWrapper', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const VenueSelectionCard(
            name: 'Ceano',
            category: 'Nikkei',
            imagePath: 'assets/images/ceano_venue_thumbnail.png',
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(TapScaleWrapper), findsOneWidget);
    });

    testWidgets('calls onTap when tapped', (tester) async {
      var tapped = false;

      await tester.pumpWidget(
        buildTestApp(
          VenueSelectionCard(
            name: 'Ceano',
            category: 'Nikkei',
            imagePath: 'assets/images/ceano_venue_thumbnail.png',
            onTap: () => tapped = true,
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.byType(GestureDetector).first);
      await tester.pumpAndSettle();

      expect(tapped, isTrue);
    });

    testWidgets('applies entrance animation when provided', (tester) async {
      final controller = AnimationController(
        vsync: tester,
        duration: const Duration(milliseconds: 300),
      );
      final animation = CurvedAnimation(
        parent: controller,
        curve: Curves.easeOut,
      );

      await tester.pumpWidget(
        buildTestApp(
          VenueSelectionCard(
            name: 'Ceano',
            category: 'Nikkei',
            imagePath: 'assets/images/ceano_venue_thumbnail.png',
            entranceAnimation: animation,
          ),
        ),
      );

      controller.forward();
      await tester.pumpAndSettle();

      expect(find.byType(FadeTransition), findsOneWidget);
      expect(find.byType(SlideTransition), findsOneWidget);

      controller.dispose();
    });
  });
}
