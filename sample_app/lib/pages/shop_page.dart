import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_app/components/product.dart';
import 'package:sample_app/components/product_tile.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  final List<Product> products = [
  Product(
    name: 'All Star',
    description: 'Cool shoes',
    price: 100.0,
    image: 'assets/allstar.jpeg'
  ),
  Product(
    name: 'Tennis',
    description: 'Cool Basket',
    price: 200.0,
    image: 'assets/basket1.png'
  ),
  Product(
    name: 'Tennis',
    description: 'Cool Basket',
    price: 300.0,
    image: 'assets/basket2.jpeg'
  ),
  Product(
    name: 'Men Shoes',
    description: 'Nice Shoes for men',
    price: 400.0,
    image: 'assets/images.jpeg'
  ),
  Product(
    name: 'Sport Shoes',
    description: 'Nice Shoes for sport',
    price: 500.0,
    image: 'assets/snaeker.png'
  ),
  Product(
    name: 'Cool Shoes',
    description: 'Nice Shoes for sport',
    price: 600.0,
    image: 'assets/sneaker1.jpeg'
  ),
  Product(
    name: 'Cool Shoes',
    description: 'Nice Shoes for sport',
    price: 600.0,
    image: 'assets/sneaker.png'
  )
];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Search for products',
              style: GoogleFonts.alata(
                textStyle: const TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold)
              ),),
              const Icon(Icons.search, color: Colors.black,),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0),
          child: Text('"Enjoy shopping with ease and simplicity"', style: GoogleFonts.alata(
            textStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.normal,
              color: Colors.grey)),),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Hots deals 🔥',
              style: GoogleFonts.alata(
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),),
              Text('See all',
              style: GoogleFonts.alata(
                textStyle: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue)),),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: products.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return ProductTile(product: products[index]);
            }
          ),
        )
      ],
    );
  }
}