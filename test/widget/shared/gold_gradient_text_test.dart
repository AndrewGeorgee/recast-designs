import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recast_designs_task/shared/widgets/gold_gradient_text.dart';
import '../../helpers/test_helpers.dart';

void main() {
  group('GoldGradientText', () {
    testWidgets('renders the provided text', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          GoldGradientText(
            text: 'Hello World',
            style: const TextStyle(fontSize: 20),
          ),
        ),
      );
      await tester.pump();

      expect(find.text('Hello World'), findsOneWidget);
    });

    testWidgets('wraps text in a ShaderMask', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          GoldGradientText(
            text: 'Gold Text',
            style: const TextStyle(fontSize: 16),
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(ShaderMask), findsOneWidget);
    });

    testWidgets('passes maxLines to the Text widget', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          GoldGradientText(
            text: 'Long text that might overflow',
            style: const TextStyle(fontSize: 14),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      );
      await tester.pump();

      final textWidget = tester.widget<Text>(find.text('Long text that might overflow'));
      expect(textWidget.maxLines, 1);
      expect(textWidget.overflow, TextOverflow.ellipsis);
    });

    testWidgets('renders without maxLines when not provided', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          GoldGradientText(
            text: 'No max lines',
            style: const TextStyle(fontSize: 14),
          ),
        ),
      );
      await tester.pump();

      final textWidget = tester.widget<Text>(find.text('No max lines'));
      expect(textWidget.maxLines, isNull);
    });

    testWidgets('forces text color to white (gradient applied via ShaderMask)', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          GoldGradientText(
            text: 'Color check',
            style: const TextStyle(fontSize: 14, color: Colors.red),
          ),
        ),
      );
      await tester.pump();

      final textWidget = tester.widget<Text>(find.text('Color check'));
      expect(textWidget.style?.color, Colors.white);
    });
  });
}
