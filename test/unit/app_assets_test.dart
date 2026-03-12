import 'package:flutter_test/flutter_test.dart';
import 'package:recast_designs_task/constants/app_assets.dart';

void main() {
  group('AppAssets', () {
    group('all paths start with "assets/"', () {
      test('iconUserDefault', () {
        expect(AppAssets.iconUserDefault, startsWith('assets/'));
      });

      test('profileAvatarPlaceholder', () {
        expect(AppAssets.profileAvatarPlaceholder, startsWith('assets/'));
      });

      test('venueCeano', () {
        expect(AppAssets.venueCeano, startsWith('assets/'));
      });

      test('venueNobiko', () {
        expect(AppAssets.venueNobiko, startsWith('assets/'));
      });

      test('venueDovely', () {
        expect(AppAssets.venueDovely, startsWith('assets/'));
      });

      test('venueOlivestree', () {
        expect(AppAssets.venueOlivestree, startsWith('assets/'));
      });

      test('logoNobikoBistro', () {
        expect(AppAssets.logoNobikoBistro, startsWith('assets/'));
      });

      test('orderFoodThumb1', () {
        expect(AppAssets.orderFoodThumb1, startsWith('assets/'));
      });

      test('orderFoodThumb2', () {
        expect(AppAssets.orderFoodThumb2, startsWith('assets/'));
      });

      test('orderFoodThumb3', () {
        expect(AppAssets.orderFoodThumb3, startsWith('assets/'));
      });
    });

    group('all paths end with ".png"', () {
      final paths = [
        AppAssets.iconUserDefault,
        AppAssets.profileAvatarPlaceholder,
        AppAssets.venueCeano,
        AppAssets.venueNobiko,
        AppAssets.venueDovely,
        AppAssets.venueOlivestree,
        AppAssets.logoNobikoBistro,
        AppAssets.orderFoodThumb1,
        AppAssets.orderFoodThumb2,
        AppAssets.orderFoodThumb3,
      ];

      for (final path in paths) {
        test(path, () {
          expect(path, endsWith('.png'));
        });
      }
    });

    test('venue paths are distinct', () {
      final venuePaths = {
        AppAssets.venueCeano,
        AppAssets.venueNobiko,
        AppAssets.venueDovely,
        AppAssets.venueOlivestree,
      };
      expect(venuePaths.length, 4);
    });

    test('order thumb paths are distinct', () {
      final thumbPaths = {
        AppAssets.orderFoodThumb1,
        AppAssets.orderFoodThumb2,
        AppAssets.orderFoodThumb3,
      };
      expect(thumbPaths.length, 3);
    });
  });
}
