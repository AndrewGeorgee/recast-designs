import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recast_designs_task/widgets/circle_avatar_group.dart';
import '../../helpers/test_helpers.dart';

void main() {
  group('CircleAvatarGroup', () {
    testWidgets('renders nothing when imageUrls is empty', (tester) async {
      await tester.pumpWidget(
        buildTestApp(const CircleAvatarGroup(imageUrls: [])),
      );
      await tester.pump();

      expect(find.byType(Stack), findsNothing);
      expect(find.byType(SizedBox), findsWidgets); // ShrinkSizedBox
    });

    testWidgets('renders a Stack for non-empty list', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const CircleAvatarGroup(
            imageUrls: ['assets/images/order_food_thumb_1.png'],
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(Stack), findsOneWidget);
    });

    testWidgets('renders correct number of Positioned children for 3 images', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const CircleAvatarGroup(
            imageUrls: [
              'assets/images/order_food_thumb_1.png',
              'assets/images/order_food_thumb_2.png',
              'assets/images/order_food_thumb_3.png',
            ],
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(Positioned), findsNWidgets(3));
    });

    testWidgets('renders correct number of containers for each image', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const CircleAvatarGroup(
            imageUrls: [
              'assets/images/order_food_thumb_1.png',
              'assets/images/order_food_thumb_2.png',
            ],
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(Positioned), findsNWidgets(2));
    });

    testWidgets('outer SizedBox height equals width of a single thumbnail', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const CircleAvatarGroup(
            imageUrls: ['assets/images/order_food_thumb_1.png'],
          ),
        ),
      );
      await tester.pump();

      // With a single thumbnail, totalWidth == size (no overlap offset needed)
      final sizedBox = tester.widget<SizedBox>(
        find.ancestor(
          of: find.byType(Stack),
          matching: find.byType(SizedBox),
        ).first,
      );
      expect(sizedBox.width, isNotNull);
      expect(sizedBox.height, isNotNull);
      expect(sizedBox.width, equals(sizedBox.height));
    });

    testWidgets('renders with network URL without throwing', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const CircleAvatarGroup(
            imageUrls: ['https://example.com/food.png'],
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(CircleAvatarGroup), findsOneWidget);
    });
  });
}
