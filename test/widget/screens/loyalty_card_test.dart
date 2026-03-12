import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recast_designs_task/constants/app_strings.dart';
import 'package:recast_designs_task/models/user.dart';
import 'package:recast_designs_task/screens/home/widgets/loyalty_card.dart';
import 'package:recast_designs_task/widgets/circle_avatar_group.dart';
import 'package:recast_designs_task/widgets/tap_scale_wrapper.dart';
import '../../helpers/test_helpers.dart';

void main() {
  const testUser = User(
    firstName: 'Asmar',
    lastName: 'Ajlouni',
    phone: '+962 234 567 2349',
    avatarUrl: 'assets/images/profile_avatar_placeholder.png',
    loyaltyPoints: 21750,
    totalOrders: 24,
    loyaltyProgress: 0.72,
  );

  const testThumbnails = [
    'assets/images/order_food_thumb_1.png',
    'assets/images/order_food_thumb_2.png',
    'assets/images/order_food_thumb_3.png',
  ];

  group('LoyaltyCard', () {
    testWidgets('shows brand name "AlterNow"', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          LoyaltyCard(user: testUser, orderAvatarUrls: testThumbnails),
        ),
      );
      await tester.pump();

      expect(find.text(AppStrings.alterNow), findsOneWidget);
    });

    testWidgets('shows "Loyalty Points" label', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          LoyaltyCard(user: testUser, orderAvatarUrls: testThumbnails),
        ),
      );
      await tester.pump();

      expect(find.text(AppStrings.loyaltyPoints), findsOneWidget);
    });

    testWidgets('formats loyalty points with commas (21,750)', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          LoyaltyCard(user: testUser, orderAvatarUrls: testThumbnails),
        ),
      );
      await tester.pump();

      expect(find.text('21,750'), findsOneWidget);
    });

    testWidgets('formats 1000 points as "1,000"', (tester) async {
      const user = User(
        firstName: 'A',
        lastName: 'B',
        phone: '',
        avatarUrl: 'assets/images/profile_avatar_placeholder.png',
        loyaltyPoints: 1000,
        totalOrders: 0,
        loyaltyProgress: 0.0,
      );
      await tester.pumpWidget(
        buildTestApp(LoyaltyCard(user: user, orderAvatarUrls: [])),
      );
      await tester.pump();

      expect(find.text('1,000'), findsOneWidget);
    });

    testWidgets('formats 999 points without comma', (tester) async {
      const user = User(
        firstName: 'A',
        lastName: 'B',
        phone: '',
        avatarUrl: 'assets/images/profile_avatar_placeholder.png',
        loyaltyPoints: 999,
        totalOrders: 0,
        loyaltyProgress: 0.0,
      );
      await tester.pumpWidget(
        buildTestApp(LoyaltyCard(user: user, orderAvatarUrls: [])),
      );
      await tester.pump();

      expect(find.text('999'), findsOneWidget);
    });

    testWidgets('shows "Total Orders" label', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          LoyaltyCard(user: testUser, orderAvatarUrls: testThumbnails),
        ),
      );
      await tester.pump();

      expect(find.text(AppStrings.totalOrders), findsOneWidget);
    });

    testWidgets('shows total orders count', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          LoyaltyCard(user: testUser, orderAvatarUrls: testThumbnails),
        ),
      );
      await tester.pump();

      expect(find.text('24'), findsOneWidget);
    });

    testWidgets('shows "More details" button', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          LoyaltyCard(user: testUser, orderAvatarUrls: testThumbnails),
        ),
      );
      await tester.pump();

      expect(find.text(AppStrings.moreDetails), findsOneWidget);
    });

    testWidgets('shows CircleAvatarGroup with order thumbnails', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          LoyaltyCard(user: testUser, orderAvatarUrls: testThumbnails),
        ),
      );
      await tester.pump();

      expect(find.byType(CircleAvatarGroup), findsOneWidget);
    });

    testWidgets('calls onMoreDetails when "More details" is tapped', (tester) async {
      var tapped = false;

      await tester.pumpWidget(
        buildTestApp(
          LoyaltyCard(
            user: testUser,
            orderAvatarUrls: testThumbnails,
            onMoreDetails: () => tapped = true,
          ),
        ),
      );
      await tester.pump();

      // The more-details TapScaleWrapper is the second GestureDetector
      await tester.tap(find.text(AppStrings.moreDetails));
      await tester.pumpAndSettle();

      expect(tapped, isTrue);
    });

    testWidgets('has a progress bar (LayoutBuilder + AnimatedBuilder)', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          LoyaltyCard(user: testUser, orderAvatarUrls: testThumbnails),
        ),
      );
      // Advance past Future.delayed(500ms)
      await tester.pump(const Duration(milliseconds: 600));
      await tester.pumpAndSettle();

      expect(find.byType(AnimatedBuilder), findsWidgets);
    });

    testWidgets('contains TapScaleWrapper widgets', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          LoyaltyCard(user: testUser, orderAvatarUrls: testThumbnails),
        ),
      );
      await tester.pump();

      expect(find.byType(TapScaleWrapper), findsWidgets);
    });
  });
}
