import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:recast_designs_task/app.dart';
import 'package:recast_designs_task/constants/app_strings.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('App integration tests', () {
    testWidgets('HomeScreen loads and shows key content', (tester) async {
      await tester.pumpWidget(const AlterNowApp());
      await tester.pumpAndSettle();

    
      expect(find.text(AppStrings.welcomeBack), findsOneWidget);
      expect(find.text('Asmar Ajlouni'), findsOneWidget);
      expect(find.text(AppStrings.alterNow), findsOneWidget);
      expect(find.text(AppStrings.loyaltyPoints), findsOneWidget);
      expect(find.text(AppStrings.totalOrders), findsOneWidget);
      expect(find.text('21,750'), findsOneWidget);
      expect(find.text(AppStrings.venueSelection), findsOneWidget);
    });

    testWidgets('HomeScreen shows venue names in grid', (tester) async {
      await tester.pumpWidget(const AlterNowApp());
      await tester.pumpAndSettle();

      expect(find.text('Ceano'), findsOneWidget);
      expect(find.text('Nobiko'), findsOneWidget);
      expect(find.text('Dovely'), findsOneWidget);
      expect(find.text('Olivestree'), findsOneWidget);
    });

    testWidgets('Tapping a venue navigates to VenueSelectionScreen', (tester) async {
      await tester.pumpWidget(const AlterNowApp());
      await tester.pumpAndSettle();

      // Tap the first venue in the grid
      await tester.tap(find.text('Ceano'));
      await tester.pumpAndSettle();

      // VenueSelectionScreen has an AppBar with the Venue Selection title
      expect(find.text(AppStrings.venueSelection), findsWidgets);
      // Back button should be present
      expect(find.byIcon(Icons.arrow_back_ios_new_rounded), findsOneWidget);
    });

    testWidgets('Back button returns from VenueSelectionScreen to HomeScreen', (tester) async {
      await tester.pumpWidget(const AlterNowApp());
      await tester.pumpAndSettle();

      // Navigate to VenueSelectionScreen
      await tester.tap(find.text('Ceano'));
      await tester.pumpAndSettle();

      // Press back
      await tester.tap(find.byIcon(Icons.arrow_back_ios_new_rounded));
      await tester.pumpAndSettle();

      // HomeScreen content is visible again
      expect(find.text(AppStrings.welcomeBack), findsOneWidget);
    });

    testWidgets('Profile tap navigates to ProfileScreen', (tester) async {
      await tester.pumpWidget(const AlterNowApp());
      await tester.pumpAndSettle();

      // The first GestureDetector in the tree is the profile button
      await tester.tap(find.byType(GestureDetector).first);
      await tester.pumpAndSettle();

      // ProfileScreen shows "Your Profile" title
      expect(find.text(AppStrings.yourProfile), findsOneWidget);
    });

    testWidgets('Back navigation from ProfileScreen returns to HomeScreen', (tester) async {
      await tester.pumpWidget(const AlterNowApp());
      await tester.pumpAndSettle();

      // Navigate to ProfileScreen
      await tester.tap(find.byType(GestureDetector).first);
      await tester.pumpAndSettle();

      // Press system back (Navigator.pop)
      final NavigatorState navigator = tester.state(find.byType(Navigator));
      navigator.pop();
      await tester.pumpAndSettle();

      // HomeScreen is visible again
      expect(find.text(AppStrings.welcomeBack), findsOneWidget);
    });

    testWidgets('ProfileScreen shows loyalty history section', (tester) async {
      await tester.pumpWidget(const AlterNowApp());
      await tester.pumpAndSettle();

      // Navigate to ProfileScreen
      await tester.tap(find.byType(GestureDetector).first);
      await tester.pumpAndSettle();

      expect(find.text(AppStrings.loyaltyHistory), findsOneWidget);
    });

    testWidgets('ProfileScreen shows user information', (tester) async {
      await tester.pumpWidget(const AlterNowApp());
      await tester.pumpAndSettle();

      // Navigate to ProfileScreen
      await tester.tap(find.byType(GestureDetector).first);
      await tester.pumpAndSettle();

      // User name displayed
      expect(find.text('Asmar Ajlouni'), findsOneWidget);
    });
  });
}
