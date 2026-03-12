import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recast_designs_task/constants/app_strings.dart';
import 'package:recast_designs_task/screens/home/widgets/welcome_header.dart';
import '../../helpers/test_helpers.dart';

void main() {
  group('WelcomeHeader', () {
    testWidgets('displays the welcome greeting', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const WelcomeHeader(fullName: 'Asmar Ajlouni'),
        ),
      );
      await tester.pump();

      expect(find.text(AppStrings.welcomeBack), findsOneWidget);
    });

    testWidgets('displays the full name', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const WelcomeHeader(fullName: 'Jane Doe'),
        ),
      );
      await tester.pump();

      expect(find.text('Jane Doe'), findsOneWidget);
    });

    testWidgets('renders a profile tap button (GestureDetector)', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const WelcomeHeader(fullName: 'Test User'),
        ),
      );
      await tester.pump();

      expect(find.byType(GestureDetector), findsOneWidget);
    });

    testWidgets('calls onProfileTap when profile button is tapped', (tester) async {
      var tapped = false;

      await tester.pumpWidget(
        buildTestApp(
          WelcomeHeader(
            fullName: 'Asmar Ajlouni',
            onProfileTap: () => tapped = true,
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.byType(GestureDetector).first);
      await tester.pumpAndSettle();

      expect(tapped, isTrue);
    });

    testWidgets('does not throw when onProfileTap is null', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const WelcomeHeader(fullName: 'Asmar Ajlouni'),
        ),
      );
      await tester.pump();

      await tester.tap(find.byType(GestureDetector).first);
      await tester.pumpAndSettle();
    });

    testWidgets('lays out greeting and button in a Row', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const WelcomeHeader(fullName: 'Test'),
        ),
      );
      await tester.pump();

      // Top-level widget is a Row
      expect(find.byType(Row), findsOneWidget);
    });

    testWidgets('wraps name in ShaderMask for gold gradient', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const WelcomeHeader(fullName: 'Asmar Ajlouni'),
        ),
      );
      await tester.pump();

      expect(find.byType(ShaderMask), findsOneWidget);
    });
  });
}
