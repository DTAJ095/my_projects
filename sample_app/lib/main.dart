import 'package:flutter/material.dart';
import 'package:sample_app/src/pages/cart_page.dart';
import 'package:sample_app/src/pages/home_page.dart';
import 'package:sample_app/src/pages/login.dart';
import 'package:sample_app/src/pages/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LoginPage(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegistryPage(),
        '/home': (context) => const HomePage(),
        '/cart': (context) => const CartPage(),
      },
    );
  }
}
