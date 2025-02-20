class Product {
  final String name;
  final String description;
  final double price;
  final String image;

  Product(
      {required this.name,
      required this.description,
      required this.price,
      required this.image});
}

  final List<Product> products = [
    Product(
        name: 'All Star',
        description: "Nice Shoes",
        price: 100,
        image: 'assets/allstar.jpeg'),
    Product(
        name: 'Basket',
        description: "Nice Basket",
        price: 100,
        image: 'assets/basket1.png'),
    Product(
        name: 'Sport Shoes',
        description: "Nice Shoes",
        price: 100,
        image: 'assets/basket2.jpeg'),
    Product(
        name: 'Sneaker',
        description: "Nice Shoes",
        price: 100,
        image: 'assets/sneaker.png'),
    Product(
      name: 'Sneaker',
      description: "Nice Shoes",
      price: 100,
      image: 'assets/sneaker1.jpeg',
    ),
  ];
