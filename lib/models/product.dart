class Product {
  final String imageUrl;
  final String description;
  final String name;
  final double price;
  final String category;
  final String reviews;
  final String specifications;

  Product({
    required this.reviews,
    required this.specifications,
    required this.imageUrl,
    required this.description,
    required this.name,
    required this.price,
    required this.category,
  });
}
