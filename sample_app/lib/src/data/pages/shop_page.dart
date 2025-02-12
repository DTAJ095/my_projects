import 'package:auto_scroll/auto_scroll.dart';
import 'package:flutter/material.dart';
import 'package:sample_app/src/components/product_tile.dart';
import 'package:sample_app/src/data/categories.dart';
import 'package:sample_app/src/data/product.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
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

  final List<Category> categories = [
    Category(categoryName: "Electronics", quantityOfProducts: 100, image: ''),
    Category(categoryName: 'Clothes', quantityOfProducts: 50, image: ''),
    Category(categoryName: 'Shoes', quantityOfProducts: 50, image: ''),
    Category(categoryName: 'Bags', quantityOfProducts: 50, image: ''),
    Category(categoryName: 'Furnitures', quantityOfProducts: 50, image: '')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
          child: Column(
        children: [
          const SizedBox(height: 20),
          SizedBox(
            width: 450,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for products',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            '"Enjoy shopping with ease and simplicity"',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Colors.grey),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hots deals 🔥',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text(
                  'See all',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          AutoScroller(
            lengthIdentifier: products.length,
            anchorThreshold: 10,
            duration: const Duration(seconds: 2),
            scrollAxis: Axis.horizontal,
            startAnchored: true,
            builder: (context, controller) {
              return SizedBox(
                height: 300,
                child: ListView.builder(
                  controller: controller,
                  itemCount: products.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return ProductTile(product: products[index]);
                  },
                ),
              );
            },
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Categories',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text(
                  'See all',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 200,
            child: ListView.builder(
              itemCount: categories.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20),
                    border: const Border.fromBorderSide(BorderSide.none),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        categories[index].categoryName,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Quantity: ${categories[index].quantityOfProducts}',
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      )),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:sample_app/components/product_tile.dart';
// import 'package:sample_app/data/categories.dart';
// import 'package:sample_app/data/product.dart';

// class ShopPage extends StatefulWidget {
//   const ShopPage({super.key});

//   @override
//   State<ShopPage> createState() => _ShopPageState();
// }

// class _ShopPageState extends State<ShopPage> {
//   final List<Product> products = [
//     Product(
//         name: 'All Star',
//         description: 'Cool shoes',
//         price: 100.0,
//         image: 'assets/allstar.jpeg'),
//     Product(
//         name: 'Tennis',
//         description: 'Cool Basket',
//         price: 200.0,
//         image: 'assets/basket1.png'),
//     Product(
//         name: 'Tennis',
//         description: 'Cool Basket',
//         price: 300.0,
//         image: 'assets/basket2.jpeg'),
//     Product(
//         name: 'Men Shoes',
//         description: 'Nice Shoes for men',
//         price: 400.0,
//         image: 'assets/images.jpeg'),
//     Product(
//         name: 'Sport Shoes',
//         description: 'Nice Shoes for sport',
//         price: 500.0,
//         image: 'assets/snaeker.png'),
//     Product(
//         name: 'Cool Shoes',
//         description: 'Nice Shoes for sport',
//         price: 600.0,
//         image: 'assets/sneaker1.jpeg'),
//     Product(
//         name: 'Cool Shoes',
//         description: 'Nice Shoes for sport',
//         price: 600.0,
//         image: 'assets/sneaker.png')
//   ];

//   final List<Category> categories = [
//     Category(categoryName: "Electronics", quantityOfProducts: 100, image: ''),
//     Category(categoryName: 'Clothes', quantityOfProducts: 50, image: ''),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           padding: const EdgeInsets.all(12),
//           margin: const EdgeInsets.symmetric(horizontal: 25),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(20),
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 'Search for products',
//                 style: GoogleFonts.alata(
//                     textStyle: const TextStyle(
//                         color: Colors.black,
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold)),
//               ),
//               const Icon(
//                 Icons.search,
//                 color: Colors.black,
//               ),
//             ],
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(vertical: 25.0),
//           child: Text(
//             '"Enjoy shopping with ease and simplicity"',
//             style: GoogleFonts.alata(
//                 textStyle: const TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.normal,
//                     color: Colors.grey)),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 'Hots deals 🔥',
//                 style: GoogleFonts.alata(
//                     textStyle: const TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white)),
//               ),
//               Text(
//                 'See all',
//                 style: GoogleFonts.alata(
//                     textStyle: const TextStyle(
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.blue)),
//               ),
//             ],
//           ),
//         ),
//         Expanded(
//           child: ListView.builder(
//               itemCount: products.length,
//               scrollDirection: Axis.horizontal,
//               itemBuilder: (context, index) {
//                 return ProductTile(product: products[index]);
//               }),
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 'Categories',
//                 style: GoogleFonts.alata(
//                     textStyle: const TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white)),
//               ),
//               Text(
//                 'See all',
//                 style: GoogleFonts.alata(
//                     textStyle: const TextStyle(
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.blue)),
//               )
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
