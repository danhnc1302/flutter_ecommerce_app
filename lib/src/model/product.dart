class Product {
  int id;
  String name;
  String category;
  String image;
  double price;
  bool isLiked;
  bool isSelected;
  Product({required this.id, required this.name, required this.category, required this.image, required this.price, required this.isLiked, this.isSelected = false});
}