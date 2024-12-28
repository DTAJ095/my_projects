import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_app/components/product.dart';

// ignore: must_be_immutable
class ProductTile extends StatelessWidget {
  ProductTile({super.key, required this.product});
  Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      margin: const EdgeInsets.only(left: 20),
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(height: 30,),
          ClipRRect(
            child: Image.asset(product.image,),
            borderRadius: BorderRadius.circular(20),),
          Text(product.description),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(product.name,
                  style: GoogleFonts.alata(
                    textStyle: const TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold)
                  ),),
                  Text("\$${product.price}",
                  style: GoogleFonts.alata(
                    textStyle: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)
                  ),),
                ],
              ),
              const SizedBox(width: 20,),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Add to cart",
                    style: GoogleFonts.alata(
                      textStyle: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)
                    ),),
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/cart');
                      },
                      icon: const Icon(Icons.add_shopping_cart_rounded, size: 30, color: Colors.white,),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}