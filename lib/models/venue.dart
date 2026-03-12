class Venue {
  final String id;
  final String name;
  final String category;
  final String imageUrl;
  final double cardHeightFactor;
  final String? brandName;

  const Venue({
    required this.id,
    required this.name,
    required this.category,
    required this.imageUrl,
    this.cardHeightFactor = 1.0,
    this.brandName,
  });
}
