import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: Column(
          children: [
            Center(
              child: Text(
                'Cart Page',
                style: GoogleFonts.alata(
                    textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            ListView.builder(itemBuilder: (context, index) {
              return ListTile(
                title: Text('Item $index'),
              );
            }),
          ],
        ));
  }
}
