class Category {
  final String categoryName;
  final int quantityOfProducts;
  final String image;

  Category ({
    required this.categoryName,
    required this.quantityOfProducts,
    required this.image
});
}

  final List<Category> categories = [
    Category(categoryName: "Electronics", quantityOfProducts: 100, image: ''),
    Category(categoryName: 'Clothes', quantityOfProducts: 50, image: ''),
    Category(categoryName: 'Shoes', quantityOfProducts: 50, image: ''),
    Category(categoryName: 'Bags', quantityOfProducts: 50, image: ''),
    Category(categoryName: 'Furnitures', quantityOfProducts: 50, image: '')
  ];