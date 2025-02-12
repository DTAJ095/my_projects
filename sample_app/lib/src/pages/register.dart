import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class RegistryPage extends StatefulWidget {
  const RegistryPage({super.key});

  @override
  State<RegistryPage> createState() => _RegistryPageState();
}

class _RegistryPageState extends State<RegistryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.9),
                  Colors.black.withOpacity(0.8),
                  Colors.black.withOpacity(0.7),
                  Colors.black.withOpacity(0.6),
                  Colors.black.withOpacity(0.5),
                  Colors.black.withOpacity(0.4),
                  Colors.black.withOpacity(0.3),
                  Colors.black.withOpacity(0.2),
                  Colors.black.withOpacity(0.1),
                  Colors.black.withOpacity(0.075),
                  Colors.black.withOpacity(0.05),
                  Colors.black.withOpacity(0.025),
                ],
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sign up here!',
                  style: GoogleFonts.alata(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,))
                ),
                const SizedBox(height: 10.0,),
                Center(
                  child: ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        height: 350,
                        width: 400,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Form(
                          child: Column(
                            children: [
                              const SizedBox(height: 10.0),
                              const TextField(
                                decoration: InputDecoration(
                                  hintText: 'Username',
                                  hintStyle: TextStyle(color: Colors.white),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              const TextField(
                                decoration: InputDecoration(
                                  hintText: 'Email',
                                  hintStyle: TextStyle(color: Colors.white),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              const TextField(
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  hintStyle: TextStyle(color: Colors.white),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              const TextField(
                                decoration: InputDecoration(
                                  hintText: 'Confirm Password',
                                  hintStyle: TextStyle(color: Colors.white),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue, style: BorderStyle.solid),
                                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/login');
                                },
                                child: Text('Sign up',
                                style: GoogleFonts.aleo(
                                  textStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ) ),),
                              ),
                            ],
                          ),
                        ),
                      ),)
                  ),
                ),
                const SizedBox(height: 20.0),
                GestureDetector(
                  onTap: () => {
                    Navigator.pushNamed(context, '/login'),
                  },
                  child: Text.rich(
                    TextSpan(
                      text: 'Already have an account? ',
                      style: GoogleFonts.alata(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Login',
                          style: GoogleFonts.alata(
                            textStyle: const TextStyle(
                              color: Colors.blue,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                ),),
                const SizedBox(height: 30.0),
                Text('Sign up with',
                style: GoogleFonts.aleo(
                  textStyle: const TextStyle(
                    color: Colors.blue,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  )
                ),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(MdiIcons.facebook),
                      onPressed: () {},
                      iconSize: 40.0,
                      color: Colors.white,
                    ),
                    IconButton(
                      icon: Icon(MdiIcons.google),
                      onPressed: () {},
                      iconSize: 40.0,
                      color: Colors.white,
                    ),
                    IconButton(
                      icon: Icon(MdiIcons.twitter),
                      onPressed: () {},
                      iconSize: 40.0,
                      color: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}