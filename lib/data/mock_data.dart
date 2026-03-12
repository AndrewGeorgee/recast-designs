import '../constants/app_assets.dart';
import '../models/user.dart';
import '../models/venue.dart';
import '../models/loyalty_entry.dart';

final mockUser = const User(
  firstName: 'Asmar',
  lastName: 'Ajlouni',
  phone: '+962 234 567 2349',
  avatarUrl: AppAssets.profileAvatarPlaceholder,
  loyaltyPoints: 21750,
  totalOrders: 24,
  loyaltyProgress: 0.72,
);

final mockVenues = const [
  Venue(
    id: '1',
    name: 'Ceano',
    category: 'Nikkei',
    imageUrl: AppAssets.venueCeano,
    cardHeightFactor: 94 / 130,
  ),
  Venue(
    id: '2',
    name: 'Nobiko',
    category: 'Restaurant',
    imageUrl: AppAssets.venueNobiko,
    cardHeightFactor: 127 / 130,
  ),
  Venue(
    id: '3',
    name: 'Dovely',
    category: 'Casual',
    imageUrl: AppAssets.venueDovely,
    cardHeightFactor: 141 / 130,
  ),
  Venue(
    id: '4',
    name: 'Olivestree',
    category: 'Bakery',
    imageUrl: AppAssets.venueOlivestree,
    cardHeightFactor: 118 / 130,
  ),
];

final mockOrderThumbnails = const [
  AppAssets.orderFoodThumb1,
  AppAssets.orderFoodThumb2,
  AppAssets.orderFoodThumb3,
];

final mockLoyaltyHistory = [
  LoyaltyEntry(
    id: 1,
    venueName: 'Nobiko Bistro',
    venueThumbnailUrl: AppAssets.logoNobikoBistro,
    date: DateTime(2025, 3, 2),
    spendAmountJD: 125.32,
    pointsEarned: 230,
    runningPointsTotal: 325,
  ),
  LoyaltyEntry(
    id: 2,
    venueName: 'Nobiko Bistro',
    venueThumbnailUrl: AppAssets.logoNobikoBistro,
    date: DateTime(2025, 2, 14),
    spendAmountJD: 125.32,
    pointsEarned: 230,
    runningPointsTotal: 325,
  ),
  LoyaltyEntry(
    id: 3,
    venueName: 'Nobiko Bistro',
    venueThumbnailUrl: AppAssets.logoNobikoBistro,
    date: DateTime(2025, 1, 28),
    spendAmountJD: 125.32,
    pointsEarned: 230,
    runningPointsTotal: 325,
  ),
  LoyaltyEntry(
    id: 4,
    venueName: 'Nobiko Bistro',
    venueThumbnailUrl: AppAssets.logoNobikoBistro,
    date: DateTime(2025, 1, 9),
    spendAmountJD: 125.32,
    pointsEarned: 230,
    runningPointsTotal: 325,
  ),
];
