import 'package:flutter_test/flutter_test.dart';
import 'package:recast_designs_task/data/mock_data.dart';
import 'package:recast_designs_task/constants/app_assets.dart';

void main() {
  group('mockUser', () {
    test('has correct name', () {
      expect(mockUser.firstName, 'Asmar');
      expect(mockUser.lastName, 'Ajlouni');
      expect(mockUser.fullName, 'Asmar Ajlouni');
    });

    test('has correct phone', () {
      expect(mockUser.phone, '+962 234 567 2349');
    });

    test('has correct loyalty stats', () {
      expect(mockUser.loyaltyPoints, 21750);
      expect(mockUser.totalOrders, 24);
      expect(mockUser.loyaltyProgress, 0.72);
    });

    test('loyaltyProgress is between 0 and 1', () {
      expect(mockUser.loyaltyProgress, greaterThanOrEqualTo(0.0));
      expect(mockUser.loyaltyProgress, lessThanOrEqualTo(1.0));
    });

    test('uses profile avatar asset path', () {
      expect(mockUser.avatarUrl, AppAssets.profileAvatarPlaceholder);
    });
  });

  group('mockVenues', () {
    test('contains exactly 4 venues', () {
      expect(mockVenues.length, 4);
    });

    test('venues have unique ids', () {
      final ids = mockVenues.map((v) => v.id).toSet();
      expect(ids.length, mockVenues.length);
    });

    test('venues have unique names', () {
      final names = mockVenues.map((v) => v.name).toSet();
      expect(names.length, mockVenues.length);
    });

    test('contains expected venue names', () {
      final names = mockVenues.map((v) => v.name).toList();
      expect(names, containsAll(['Ceano', 'Nobiko', 'Dovely', 'Olivestree']));
    });

    test('all cardHeightFactors are positive', () {
      for (final venue in mockVenues) {
        expect(venue.cardHeightFactor, greaterThan(0));
      }
    });

    test('all imageUrls start with assets/', () {
      for (final venue in mockVenues) {
        expect(venue.imageUrl, startsWith('assets/'));
      }
    });

    test('Ceano has Nikkei category', () {
      final ceano = mockVenues.firstWhere((v) => v.name == 'Ceano');
      expect(ceano.category, 'Nikkei');
    });

    test('Nobiko has Restaurant category', () {
      final nobiko = mockVenues.firstWhere((v) => v.name == 'Nobiko');
      expect(nobiko.category, 'Restaurant');
    });
  });

  group('mockOrderThumbnails', () {
    test('contains exactly 3 thumbnails', () {
      expect(mockOrderThumbnails.length, 3);
    });

    test('all paths start with assets/', () {
      for (final path in mockOrderThumbnails) {
        expect(path, startsWith('assets/'));
      }
    });

    test('all paths are distinct', () {
      final unique = mockOrderThumbnails.toSet();
      expect(unique.length, mockOrderThumbnails.length);
    });
  });

  group('mockLoyaltyHistory', () {
    test('contains exactly 4 entries', () {
      expect(mockLoyaltyHistory.length, 4);
    });

    test('entries have unique ids', () {
      final ids = mockLoyaltyHistory.map((e) => e.id).toSet();
      expect(ids.length, mockLoyaltyHistory.length);
    });

    test('all spend amounts are positive', () {
      for (final entry in mockLoyaltyHistory) {
        expect(entry.spendAmountJD, greaterThan(0));
      }
    });

    test('all pointsEarned are positive', () {
      for (final entry in mockLoyaltyHistory) {
        expect(entry.pointsEarned, greaterThan(0));
      }
    });

    test('all runningPointsTotals are positive', () {
      for (final entry in mockLoyaltyHistory) {
        expect(entry.runningPointsTotal, greaterThan(0));
      }
    });

    test('first entry matches mockUser loyaltyPoints', () {
      expect(mockLoyaltyHistory.first.runningPointsTotal, mockUser.loyaltyPoints);
    });

    test('entries are in descending date order', () {
      for (var i = 0; i < mockLoyaltyHistory.length - 1; i++) {
        expect(
          mockLoyaltyHistory[i].date.isAfter(mockLoyaltyHistory[i + 1].date),
          isTrue,
        );
      }
    });
  });
}
