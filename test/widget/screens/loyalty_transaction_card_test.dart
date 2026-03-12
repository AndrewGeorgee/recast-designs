import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recast_designs_task/constants/app_strings.dart';
import 'package:recast_designs_task/models/loyalty_entry.dart';
import 'package:recast_designs_task/screens/profile/widgets/loyalty_transaction_card.dart';
import 'package:recast_designs_task/shared/widgets/gold_credits_badge.dart';
import 'package:recast_designs_task/shared/widgets/gold_gradient_text.dart';
import 'package:recast_designs_task/shared/widgets/venue_thumbnail_box.dart';
import '../../helpers/test_helpers.dart';

void main() {
  final testEntry = LoyaltyEntry(
    id: 1,
    venueName: 'Nobiko Bistro',
    venueThumbnailUrl: 'assets/images/nobiko_bistro_logo.png',
    date: DateTime(2025, 3, 2),
    spendAmountJD: 125.32,
    pointsEarned: 230,
    runningPointsTotal: 21750,
  );

  group('LoyaltyTransactionCard', () {
    testWidgets('displays venue name', (tester) async {
      await tester.pumpWidget(
        buildTestApp(LoyaltyTransactionCard(transaction: testEntry)),
      );
      await tester.pump();

      expect(find.text('Nobiko Bistro'), findsOneWidget);
    });

    testWidgets('formats date correctly (02 Mar, 2025)', (tester) async {
      await tester.pumpWidget(
        buildTestApp(LoyaltyTransactionCard(transaction: testEntry)),
      );
      await tester.pump();

      expect(find.text('02 Mar, 2025'), findsOneWidget);
    });

    testWidgets('formats date for January correctly', (tester) async {
      final jan = LoyaltyEntry(
        id: 2,
        venueName: 'Test',
        venueThumbnailUrl: 'assets/images/nobiko_bistro_logo.png',
        date: DateTime(2025, 1, 6),
        spendAmountJD: 54.50,
        pointsEarned: 100,
        runningPointsTotal: 20970,
      );

      await tester.pumpWidget(
        buildTestApp(LoyaltyTransactionCard(transaction: jan)),
      );
      await tester.pump();

      expect(find.text('06 Jan, 2025'), findsOneWidget);
    });

    testWidgets('formats date for February with zero-padded day', (tester) async {
      final feb = LoyaltyEntry(
        id: 3,
        venueName: 'Test',
        venueThumbnailUrl: 'assets/images/nobiko_bistro_logo.png',
        date: DateTime(2025, 2, 5),
        spendAmountJD: 80.0,
        pointsEarned: 150,
        runningPointsTotal: 20000,
      );

      await tester.pumpWidget(
        buildTestApp(LoyaltyTransactionCard(transaction: feb)),
      );
      await tester.pump();

      expect(find.text('05 Feb, 2025'), findsOneWidget);
    });

    testWidgets('displays spend amount and points in GoldGradientText', (tester) async {
      await tester.pumpWidget(
        buildTestApp(LoyaltyTransactionCard(transaction: testEntry)),
      );
      await tester.pump();

      expect(find.byType(GoldGradientText), findsOneWidget);

      final gradientText = tester.widget<GoldGradientText>(
        find.byType(GoldGradientText),
      );
      expect(gradientText.text, contains('125.32'));
      expect(gradientText.text, contains('230'));
      expect(gradientText.text, contains(AppStrings.jd));
      expect(gradientText.text, contains(AppStrings.credits));
    });

    testWidgets('shows running points total in GoldCreditsBadge', (tester) async {
      await tester.pumpWidget(
        buildTestApp(LoyaltyTransactionCard(transaction: testEntry)),
      );
      await tester.pump();

      expect(find.byType(GoldCreditsBadge), findsOneWidget);

      final badge = tester.widget<GoldCreditsBadge>(find.byType(GoldCreditsBadge));
      expect(badge.label, contains('21750'));
      expect(badge.label, contains(AppStrings.credits));
    });

    testWidgets('shows venue thumbnail', (tester) async {
      await tester.pumpWidget(
        buildTestApp(LoyaltyTransactionCard(transaction: testEntry)),
      );
      await tester.pump();

      expect(find.byType(VenueThumbnailBox), findsOneWidget);
    });

    testWidgets('shows a chevron icon', (tester) async {
      await tester.pumpWidget(
        buildTestApp(LoyaltyTransactionCard(transaction: testEntry)),
      );
      await tester.pump();

      expect(find.byIcon(Icons.chevron_right_rounded), findsOneWidget);
    });
  });
}
