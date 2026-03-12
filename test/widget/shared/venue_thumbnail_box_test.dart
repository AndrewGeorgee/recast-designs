import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recast_designs_task/shared/widgets/venue_thumbnail_box.dart';
import '../../helpers/test_helpers.dart';

void main() {
  group('VenueThumbnailBox', () {
    testWidgets('renders without errors for asset path', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const VenueThumbnailBox(
            imageUrl: 'assets/images/nobiko_bistro_logo.png',
            boxSize: 52,
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(VenueThumbnailBox), findsOneWidget);
    });

    testWidgets('wraps in ClipRRect for rounded corners', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const VenueThumbnailBox(
            imageUrl: 'assets/images/nobiko_bistro_logo.png',
            boxSize: 52,
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(ClipRRect), findsWidgets);
    });

    testWidgets('outer container has black background', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const VenueThumbnailBox(
            imageUrl: 'assets/images/nobiko_bistro_logo.png',
            boxSize: 52,
          ),
        ),
      );
      await tester.pump();

      final containers = tester.widgetList<Container>(find.byType(Container));
      final blackContainer = containers.firstWhere(
        (c) => c.color == Colors.black,
        orElse: () => throw TestFailure('No black container found'),
      );
      expect(blackContainer.color, Colors.black);
    });

    testWidgets('uses Image.asset for asset paths', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const VenueThumbnailBox(
            imageUrl: 'assets/images/nobiko_bistro_logo.png',
            boxSize: 52,
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('renders for network URL', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const VenueThumbnailBox(
            imageUrl: 'https://example.com/logo.png',
            boxSize: 52,
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(VenueThumbnailBox), findsOneWidget);
    });

    testWidgets('accepts custom imageSize and borderRadius', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const VenueThumbnailBox(
            imageUrl: 'assets/images/nobiko_bistro_logo.png',
            boxSize: 64,
            imageSize: 40,
            borderRadius: 10,
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(VenueThumbnailBox), findsOneWidget);
    });
  });
}
