import 'package:flutter_test/flutter_test.dart';
import 'package:recast_designs_task/models/venue.dart';

void main() {
  group('Venue', () {
    test('stores required properties correctly', () {
      const venue = Venue(
        id: '1',
        name: 'Ceano',
        category: 'Nikkei',
        imageUrl: 'assets/images/ceano_venue_thumbnail.png',
      );

      expect(venue.id, '1');
      expect(venue.name, 'Ceano');
      expect(venue.category, 'Nikkei');
      expect(venue.imageUrl, 'assets/images/ceano_venue_thumbnail.png');
    });

    test('cardHeightFactor defaults to 1.0', () {
      const venue = Venue(
        id: '1',
        name: 'Test',
        category: 'Cat',
        imageUrl: 'assets/test.png',
      );
      expect(venue.cardHeightFactor, 1.0);
    });

    test('cardHeightFactor can be set explicitly', () {
      const venue = Venue(
        id: '2',
        name: 'Test',
        category: 'Cat',
        imageUrl: 'assets/test.png',
        cardHeightFactor: 0.75,
      );
      expect(venue.cardHeightFactor, 0.75);
    });

    test('brandName defaults to null', () {
      const venue = Venue(
        id: '1',
        name: 'Test',
        category: 'Cat',
        imageUrl: 'assets/test.png',
      );
      expect(venue.brandName, isNull);
    });

    test('brandName can be set', () {
      const venue = Venue(
        id: '1',
        name: 'Test',
        category: 'Cat',
        imageUrl: 'assets/test.png',
        brandName: 'Nobiko Group',
      );
      expect(venue.brandName, 'Nobiko Group');
    });

    test('cardHeightFactor can be derived from pixel values', () {
      const venue = Venue(
        id: '1',
        name: 'Test',
        category: 'Cat',
        imageUrl: 'assets/test.png',
        cardHeightFactor: 94 / 130,
      );
      expect(venue.cardHeightFactor, closeTo(0.723, 0.001));
    });
  });
}
