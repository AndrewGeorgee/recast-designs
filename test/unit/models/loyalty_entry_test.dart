import 'package:flutter_test/flutter_test.dart';
import 'package:recast_designs_task/models/loyalty_entry.dart';

void main() {
  group('LoyaltyEntry', () {
    final entry = LoyaltyEntry(
      id: 1,
      venueName: 'Nobiko Bistro',
      venueThumbnailUrl: 'assets/images/nobiko_bistro_logo.png',
      date: DateTime(2025, 3, 2),
      spendAmountJD: 125.32,
      pointsEarned: 230,
      runningPointsTotal: 21750,
    );

    test('stores all properties correctly', () {
      expect(entry.id, 1);
      expect(entry.venueName, 'Nobiko Bistro');
      expect(entry.venueThumbnailUrl, 'assets/images/nobiko_bistro_logo.png');
      expect(entry.date, DateTime(2025, 3, 2));
      expect(entry.spendAmountJD, 125.32);
      expect(entry.pointsEarned, 230);
      expect(entry.runningPointsTotal, 21750);
    });

    test('date stores year, month and day correctly', () {
      expect(entry.date.year, 2025);
      expect(entry.date.month, 3);
      expect(entry.date.day, 2);
    });

    test('spendAmountJD supports decimal values', () {
      final e = LoyaltyEntry(
        id: 2,
        venueName: 'Venue',
        venueThumbnailUrl: '',
        date: DateTime(2025, 1, 1),
        spendAmountJD: 88.00,
        pointsEarned: 160,
        runningPointsTotal: 21520,
      );
      expect(e.spendAmountJD, 88.00);
    });

    test('id is unique across different entries', () {
      final entry2 = LoyaltyEntry(
        id: 2,
        venueName: 'Other',
        venueThumbnailUrl: '',
        date: DateTime(2025, 2, 1),
        spendAmountJD: 50.0,
        pointsEarned: 90,
        runningPointsTotal: 21000,
      );
      expect(entry.id, isNot(entry2.id));
    });
  });
}
