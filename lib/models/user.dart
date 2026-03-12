class User {
  final String firstName;
  final String lastName;
  final String phone;
  final String avatarUrl;
  final int loyaltyPoints;
  final int totalOrders;
  final double loyaltyProgress;

  const User({
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.avatarUrl,
    required this.loyaltyPoints,
    required this.totalOrders,
    required this.loyaltyProgress,
  });

  String get fullName => '$firstName $lastName';
}
