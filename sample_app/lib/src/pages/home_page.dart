import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:sample_app/src/pages/cart_page.dart';
import 'package:sample_app/src/pages/shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //pages to display
  final List<Widget> _pages = [const ShopPage(), const CartPage()];
  int _currentIndex = 0;
  bool isPressed = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
            builder: (context) => IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                )),
      ),
      bottomNavigationBar: myBottomNavBar(),
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: Column(
          children: [
            const SizedBox(height: 50),
            // logo
            Column(
              children: [
                const CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.blue,
                  child: CircleAvatar(
                    radius: 55,
                    backgroundImage: AssetImage('assets/image1.jpg'),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Jaures Alban',
                  style: GoogleFonts.alata(
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                )
              ],
            ),
            Divider(color: Colors.grey[700]),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: ListTile(
                title: Text(
                  'Home',
                  style: GoogleFonts.alata(
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ),
                leading: Icon(MdiIcons.home, color: Colors.white),
                onTap: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: ListTile(
                title: Text(
                  'Settings',
                  style: GoogleFonts.alata(
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ),
                leading: const Icon(Icons.settings, color: Colors.white),
                onTap: () {},
              ),
            ),
            const SizedBox(height: 350.0),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 25),
              child: ListTile(
                title: Text(
                  'Logout',
                  style: GoogleFonts.alata(
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ),
                leading: Icon(MdiIcons.logout, color: Colors.white),
                onTap: () {},
              ),
            )
          ],
        ),
      ),
      body: _pages[_currentIndex],
    );
  }

  Widget myBottomNavBar() {
    return ClipRect(
        child: Container(
      height: 100.0,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.01),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 80.0,
                width: 150.0,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _currentIndex = 0;
                      isPressed = !isPressed;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    elevation: 20.0,
                    shadowColor: Colors.grey[900],
                    backgroundColor: isPressed ? Colors.blue : Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(MdiIcons.store,
                          color: isPressed ? Colors.white : Colors.black),
                      Text(
                        'Shop',
                        style: GoogleFonts.alata(
                            textStyle: isPressed
                                ? const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)
                                : const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 80.0,
                width: 150.0,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _currentIndex = 1;
                      isPressed = !isPressed;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    elevation: 20.0,
                    shadowColor: Colors.grey[900],
                    backgroundColor: isPressed ? Colors.white : Colors.blue,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(MdiIcons.cart,
                          color: isPressed ? Colors.black : Colors.white),
                      Text('Cart',
                          style: GoogleFonts.alata(
                              textStyle: isPressed
                                  ? const TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)
                                  : const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold))),
                    ],
                  ),
                ),
              )
            ],
          )),
    ));
  }
}
