import 'package:flutter_test/flutter_test.dart';
import 'package:recast_designs_task/models/user.dart';

void main() {
  group('User', () {
    const user = User(
      firstName: 'Jane',
      lastName: 'Doe',
      phone: '+1 555 123 4567',
      avatarUrl: 'assets/images/profile_avatar_placeholder.png',
      loyaltyPoints: 5000,
      totalOrders: 12,
      loyaltyProgress: 0.5,
    );

    test('stores all properties correctly', () {
      expect(user.firstName, 'Jane');
      expect(user.lastName, 'Doe');
      expect(user.phone, '+1 555 123 4567');
      expect(user.avatarUrl, 'assets/images/profile_avatar_placeholder.png');
      expect(user.loyaltyPoints, 5000);
      expect(user.totalOrders, 12);
      expect(user.loyaltyProgress, 0.5);
    });

    test('fullName concatenates firstName and lastName', () {
      expect(user.fullName, 'Jane Doe');
    });

    test('fullName with single-word names', () {
      const u = User(
        firstName: 'Asmar',
        lastName: 'Ajlouni',
        phone: '',
        avatarUrl: '',
        loyaltyPoints: 0,
        totalOrders: 0,
        loyaltyProgress: 0,
      );
      expect(u.fullName, 'Asmar Ajlouni');
    });

    test('loyaltyProgress can be 0', () {
      const u = User(
        firstName: 'A',
        lastName: 'B',
        phone: '',
        avatarUrl: '',
        loyaltyPoints: 0,
        totalOrders: 0,
        loyaltyProgress: 0.0,
      );
      expect(u.loyaltyProgress, 0.0);
    });

    test('loyaltyProgress can be 1.0 (full)', () {
      const u = User(
        firstName: 'A',
        lastName: 'B',
        phone: '',
        avatarUrl: '',
        loyaltyPoints: 100,
        totalOrders: 50,
        loyaltyProgress: 1.0,
      );
      expect(u.loyaltyProgress, 1.0);
    });
  });
}
