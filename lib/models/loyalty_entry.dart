class LoyaltyEntry {
  final int id;
  final String venueName;
  final String venueThumbnailUrl;
  final DateTime date;
  final double spendAmountJD;
  final int pointsEarned;
  final int runningPointsTotal;

  const LoyaltyEntry({
    required this.id,
    required this.venueName,
    required this.venueThumbnailUrl,
    required this.date,
    required this.spendAmountJD,
    required this.pointsEarned,
    required this.runningPointsTotal,
  });
}
