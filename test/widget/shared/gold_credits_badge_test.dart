import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recast_designs_task/shared/widgets/gold_credits_badge.dart';
import '../../helpers/test_helpers.dart';

void main() {
  group('GoldCreditsBadge', () {
    testWidgets('renders the label text', (tester) async {
      await tester.pumpWidget(
        buildTestApp(const GoldCreditsBadge(label: '21750 Credits')),
      );
      await tester.pump();

      expect(find.text('21750 Credits'), findsOneWidget);
    });

    testWidgets('uses a Container with gradient decoration', (tester) async {
      await tester.pumpWidget(
        buildTestApp(const GoldCreditsBadge(label: '500 Credits')),
      );
      await tester.pump();

      final containers = tester.widgetList<Container>(find.byType(Container));
      final badgeContainer = containers.firstWhere(
        (c) =>
            c.decoration is BoxDecoration &&
            (c.decoration as BoxDecoration).gradient != null,
        orElse: () => throw TestFailure('No container with gradient found'),
      );

      final decoration = badgeContainer.decoration as BoxDecoration;
      expect(decoration.gradient, isA<LinearGradient>());
    });

    testWidgets('renders different label values', (tester) async {
      await tester.pumpWidget(
        buildTestApp(const GoldCreditsBadge(label: '100 Credits')),
      );
      await tester.pump();

      expect(find.text('100 Credits'), findsOneWidget);
    });

    testWidgets('renders inside a rounded container', (tester) async {
      await tester.pumpWidget(
        buildTestApp(const GoldCreditsBadge(label: 'Test')),
      );
      await tester.pump();

      final containers = tester.widgetList<Container>(find.byType(Container));
      final roundedContainer = containers.firstWhere(
        (c) =>
            c.decoration is BoxDecoration &&
            (c.decoration as BoxDecoration).borderRadius != null,
        orElse: () => throw TestFailure('No rounded container found'),
      );

      final decoration = roundedContainer.decoration as BoxDecoration;
      expect(decoration.borderRadius, isNotNull);
    });
  });
}
