import 'package:flutter_test/flutter_test.dart';
import 'package:recast_designs_task/constants/app_strings.dart';

void main() {
  group('AppStrings', () {
    group('home strings', () {
      test('welcomeBack is correct', () {
        expect(AppStrings.welcomeBack, 'Welcome Back,');
      });

      test('venueSelection is correct', () {
        expect(AppStrings.venueSelection, 'Venue Selection');
      });
    });

    group('loyalty card strings', () {
      test('alterNow is correct', () {
        expect(AppStrings.alterNow, 'AlterNow');
      });

      test('loyaltyPoints is correct', () {
        expect(AppStrings.loyaltyPoints, 'Loyalty Points');
      });

      test('totalOrders is correct', () {
        expect(AppStrings.totalOrders, 'Total Orders');
      });

      test('moreDetails is correct', () {
        expect(AppStrings.moreDetails, 'More details');
      });
    });

    group('profile strings', () {
      test('yourProfile is correct', () {
        expect(AppStrings.yourProfile, 'Your Profile');
      });

      test('loyaltyHistory is correct', () {
        expect(AppStrings.loyaltyHistory, 'LOYALTY HISTORY');
      });

      test('edit is correct', () {
        expect(AppStrings.edit, 'Edit');
      });
    });

    group('transaction strings', () {
      test('credits is correct', () {
        expect(AppStrings.credits, 'Credits');
      });

      test('jd is correct', () {
        expect(AppStrings.jd, 'JD');
      });
    });

    group('monthNamesShort', () {
      test('has exactly 12 months', () {
        expect(AppStrings.monthNamesShort.length, 12);
      });

      test('months are in correct order', () {
        expect(AppStrings.monthNamesShort[0], 'Jan');
        expect(AppStrings.monthNamesShort[1], 'Feb');
        expect(AppStrings.monthNamesShort[2], 'Mar');
        expect(AppStrings.monthNamesShort[3], 'Apr');
        expect(AppStrings.monthNamesShort[4], 'May');
        expect(AppStrings.monthNamesShort[5], 'Jun');
        expect(AppStrings.monthNamesShort[6], 'Jul');
        expect(AppStrings.monthNamesShort[7], 'Aug');
        expect(AppStrings.monthNamesShort[8], 'Sep');
        expect(AppStrings.monthNamesShort[9], 'Oct');
        expect(AppStrings.monthNamesShort[10], 'Nov');
        expect(AppStrings.monthNamesShort[11], 'Dec');
      });

      test('month index matches DateTime.month - 1', () {
        // DateTime.month is 1-based, so March = month 3, index = 2
        final march = DateTime(2025, 3, 15);
        expect(AppStrings.monthNamesShort[march.month - 1], 'Mar');
      });
    });
  });
}
