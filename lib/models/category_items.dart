class CategoryModel {
  final String title;
  final String imageurl;
  bool isActive;

  CategoryModel({
    required this.title,
    required this.imageurl,
    this.isActive = false,
  });
}
