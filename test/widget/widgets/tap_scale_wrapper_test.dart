import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recast_designs_task/widgets/tap_scale_wrapper.dart';
import '../../helpers/test_helpers.dart';

void main() {
  group('TapScaleWrapper', () {
    testWidgets('renders its child', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          TapScaleWrapper(
            child: const Text('Tap me'),
          ),
        ),
      );
      await tester.pump();

      expect(find.text('Tap me'), findsOneWidget);
    });

    testWidgets('wraps child in a GestureDetector', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          TapScaleWrapper(
            child: const Text('Child'),
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(GestureDetector), findsOneWidget);
    });

    testWidgets('wraps child in a ScaleTransition', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          TapScaleWrapper(
            child: const Text('Child'),
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(ScaleTransition), findsOneWidget);
    });

    testWidgets('calls onTap callback when tapped', (tester) async {
      var tapped = false;

      await tester.pumpWidget(
        buildTestApp(
          TapScaleWrapper(
            onTap: () => tapped = true,
            child: const Text('Tap me'),
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.text('Tap me'));
      await tester.pumpAndSettle();

      expect(tapped, isTrue);
    });

    testWidgets('does not throw when onTap is null', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          TapScaleWrapper(
            child: const Text('No callback'),
          ),
        ),
      );
      await tester.pump();

      // Should not throw
      await tester.tap(find.text('No callback'));
      await tester.pumpAndSettle();
    });

    testWidgets('onTap is called exactly once per tap', (tester) async {
      var tapCount = 0;

      await tester.pumpWidget(
        buildTestApp(
          TapScaleWrapper(
            onTap: () => tapCount++,
            child: const Text('Count tap'),
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.text('Count tap'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Count tap'));
      await tester.pumpAndSettle();

      expect(tapCount, 2);
    });

    testWidgets('accepts custom scaleFactor', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          TapScaleWrapper(
            scaleFactor: 0.90,
            child: const Text('Custom scale'),
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(TapScaleWrapper), findsOneWidget);
    });
  });
}
