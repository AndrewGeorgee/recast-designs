import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recast_designs_task/shared/widgets/user_avatar_ring.dart';
import '../../helpers/test_helpers.dart';

void main() {
  group('UserAvatarRing', () {
    testWidgets('renders a CircleAvatar', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const UserAvatarRing(
            imageUrl: 'assets/images/profile_avatar_placeholder.png',
            radius: 20,
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(CircleAvatar), findsOneWidget);
    });

    testWidgets('outer container has a circular gradient decoration', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const UserAvatarRing(
            imageUrl: 'assets/images/profile_avatar_placeholder.png',
            radius: 24,
          ),
        ),
      );
      await tester.pump();

      final containers = tester.widgetList<Container>(find.byType(Container));
      final ringContainer = containers.firstWhere(
        (c) =>
            c.decoration is BoxDecoration &&
            (c.decoration as BoxDecoration).shape == BoxShape.circle &&
            (c.decoration as BoxDecoration).gradient != null,
        orElse: () => throw TestFailure('No circular gradient container found'),
      );

      final decoration = ringContainer.decoration as BoxDecoration;
      expect(decoration.gradient, isA<LinearGradient>());
    });

    testWidgets('uses AssetImage for asset paths', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const UserAvatarRing(
            imageUrl: 'assets/images/profile_avatar_placeholder.png',
            radius: 20,
          ),
        ),
      );
      await tester.pump();

      final circleAvatar = tester.widget<CircleAvatar>(find.byType(CircleAvatar));
      expect(circleAvatar.backgroundImage, isA<AssetImage>());
    });

    testWidgets('uses NetworkImage for http URLs', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const UserAvatarRing(
            imageUrl: 'https://example.com/avatar.png',
            radius: 20,
          ),
        ),
      );
      await tester.pump();

      final circleAvatar = tester.widget<CircleAvatar>(find.byType(CircleAvatar));
      expect(circleAvatar.backgroundImage, isA<NetworkImage>());
    });
  });
}
